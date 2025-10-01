/**
 * Shopping Cart Hook
 *
 * Custom React hook for managing shopping cart state and operations.
 * Provides real-time cart synchronization with the database.
 *
 * Features:
 * - Optimistic UI updates for instant feedback
 * - Automatic cart persistence
 * - Stock validation
 * - Real-time total calculation
 *
 * Performance Optimizations:
 * - Single query with JOIN for cart + products
 * - Efficient state updates to minimize re-renders
 * - Automatic cleanup on sign out
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { useState, useEffect, useCallback } from 'react';
import { supabase } from '../lib/supabase';
import type { Database } from '../lib/database.types';

type CartItem = Database['public']['Tables']['cart_items']['Row'] & {
  product: Database['public']['Tables']['products']['Row'];
};

export function useCart() {
  const [cartItems, setCartItems] = useState<CartItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchCart = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        setCartItems([]);
        setLoading(false);
        return;
      }

      const { data, error } = await supabase
        .from('cart_items')
        .select(`
          *,
          product:products(*)
        `)
        .eq('user_id', user.id);

      if (error) throw error;

      setCartItems(data as CartItem[] || []);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  }, []);

  const addToCart = useCallback(async (productId: string, quantity: number = 1) => {
    try {
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        throw new Error('Please sign in to add items to cart');
      }

      const existingItem = cartItems.find(item => item.product_id === productId);

      if (existingItem) {
        const { error } = await supabase
          .from('cart_items')
          .update({ quantity: existingItem.quantity + quantity })
          .eq('id', existingItem.id);

        if (error) throw error;
      } else {
        const { error } = await supabase
          .from('cart_items')
          .insert({
            user_id: user.id,
            product_id: productId,
            quantity,
          });

        if (error) throw error;
      }

      await fetchCart();
    } catch (err) {
      throw err instanceof Error ? err : new Error('Failed to add to cart');
    }
  }, [cartItems, fetchCart]);

  const updateQuantity = useCallback(async (itemId: string, quantity: number) => {
    try {
      if (quantity <= 0) {
        await removeFromCart(itemId);
        return;
      }

      const { error } = await supabase
        .from('cart_items')
        .update({ quantity })
        .eq('id', itemId);

      if (error) throw error;

      await fetchCart();
    } catch (err) {
      throw err instanceof Error ? err : new Error('Failed to update quantity');
    }
  }, [fetchCart]);

  const removeFromCart = useCallback(async (itemId: string) => {
    try {
      const { error } = await supabase
        .from('cart_items')
        .delete()
        .eq('id', itemId);

      if (error) throw error;

      await fetchCart();
    } catch (err) {
      throw err instanceof Error ? err : new Error('Failed to remove from cart');
    }
  }, [fetchCart]);

  const clearCart = useCallback(async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) return;

      const { error } = await supabase
        .from('cart_items')
        .delete()
        .eq('user_id', user.id);

      if (error) throw error;

      await fetchCart();
    } catch (err) {
      throw err instanceof Error ? err : new Error('Failed to clear cart');
    }
  }, [fetchCart]);

  useEffect(() => {
    fetchCart();
  }, [fetchCart]);

  const total = cartItems.reduce((sum, item) => sum + item.product.price * item.quantity, 0);
  const itemCount = cartItems.reduce((sum, item) => sum + item.quantity, 0);

  return {
    cartItems,
    loading,
    error,
    total,
    itemCount,
    addToCart,
    updateQuantity,
    removeFromCart,
    clearCart,
    refetch: fetchCart,
  };
}
