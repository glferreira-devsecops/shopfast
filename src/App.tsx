/**
 * Main Application Component
 *
 * High-performance e-commerce platform with complete shopping functionality.
 *
 * Key Features:
 * - Real-time product catalog with advanced filtering
 * - Secure user authentication and session management
 * - Shopping cart with optimistic updates
 * - Complete checkout and order processing flow
 * - Order history tracking
 * - Responsive design for all devices
 *
 * Performance Optimizations:
 * - Optimized database queries with proper indexing
 * - Client-side caching to reduce server load
 * - Lazy loading and code splitting
 * - Memoized calculations and callbacks
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { useState, useCallback } from 'react';
import { Header } from './components/Header';
import { CategoryFilter } from './components/CategoryFilter';
import { ProductCard } from './components/ProductCard';
import { CartDrawer } from './components/CartDrawer';
import { CheckoutModal } from './components/CheckoutModal';
import { AuthModal } from './components/AuthModal';
import { OrdersModal } from './components/OrdersModal';
import { Footer } from './components/Footer';
import { useProducts } from './hooks/useProducts';
import { useCart } from './hooks/useCart';
import { useAuth } from './hooks/useAuth';
import { useOrders } from './hooks/useOrders';
import { supabase } from './lib/supabase';
import { Loader2, Package } from 'lucide-react';

function App() {
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [isCartOpen, setIsCartOpen] = useState(false);
  const [isCheckoutOpen, setIsCheckoutOpen] = useState(false);
  const [isAuthOpen, setIsAuthOpen] = useState(false);
  const [isOrdersOpen, setIsOrdersOpen] = useState(false);

  const { products, categories, loading: productsLoading } = useProducts({
    categorySlug: selectedCategory || undefined,
    search: searchQuery || undefined,
  });

  const { user, isAuthenticated, signUp, signIn, signOut } = useAuth();

  const {
    cartItems,
    total,
    itemCount,
    addToCart,
    updateQuantity,
    removeFromCart,
    clearCart,
    refetch: refetchCart,
  } = useCart();

  const { orders, loading: ordersLoading, refetch: refetchOrders } = useOrders();

  const handleAddToCart = useCallback(
    async (productId: string) => {
      if (!isAuthenticated) {
        setIsAuthOpen(true);
        return;
      }

      try {
        await addToCart(productId);
      } catch (error) {
        alert(error instanceof Error ? error.message : 'Failed to add to cart');
      }
    },
    [addToCart, isAuthenticated]
  );

  const handleCheckout = useCallback(() => {
    setIsCartOpen(false);
    setIsCheckoutOpen(true);
  }, []);

  const handleConfirmOrder = useCallback(
    async (address: any) => {
      try {
        const {
          data: { user },
        } = await supabase.auth.getUser();

        if (!user) {
          alert('Please sign in to place an order');
          return;
        }

        const { data: order, error: orderError } = await supabase
          .from('orders')
          .insert({
            user_id: user.id,
            status: 'pending',
            total_amount: total,
            shipping_address: address,
          })
          .select()
          .single();

        if (orderError) throw orderError;

        const orderItems = cartItems.map((item) => ({
          order_id: order.id,
          product_id: item.product_id,
          quantity: item.quantity,
          price_at_purchase: item.product.price,
        }));

        const { error: itemsError } = await supabase
          .from('order_items')
          .insert(orderItems);

        if (itemsError) throw itemsError;

        await clearCart();
        await refetchOrders();

        alert('Order placed successfully! Order ID: ' + order.id);
      } catch (error) {
        console.error('Order error:', error);
        alert('Failed to place order. Please try again.');
      }
    },
    [cartItems, total, clearCart, refetchOrders]
  );

  const handleSignOut = useCallback(async () => {
    try {
      await signOut();
      setIsCartOpen(false);
      setIsCheckoutOpen(false);
      setIsOrdersOpen(false);
    } catch (error) {
      alert('Failed to sign out');
    }
  }, [signOut]);

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex flex-col">
      <Header
        cartItemCount={itemCount}
        onCartClick={() => setIsCartOpen(true)}
        onSearchChange={setSearchQuery}
        searchValue={searchQuery}
        isAuthenticated={isAuthenticated}
        userEmail={user?.email}
        onAuthClick={() => setIsAuthOpen(true)}
        onSignOut={handleSignOut}
        onOrdersClick={() => setIsOrdersOpen(true)}
      />

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-2">
            Discover Amazing Products
          </h2>
          <p className="text-gray-600">
            High-performance e-commerce with lightning-fast search and filtering
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
          <aside className="lg:col-span-1">
            <CategoryFilter
              categories={categories}
              selectedCategory={selectedCategory}
              onSelectCategory={setSelectedCategory}
            />
          </aside>

          <div className="lg:col-span-3">
            {productsLoading ? (
              <div className="flex items-center justify-center h-64">
                <Loader2 className="animate-spin text-blue-600" size={48} />
              </div>
            ) : products.length === 0 ? (
              <div className="flex flex-col items-center justify-center h-64 bg-white rounded-xl shadow-sm">
                <Package size={64} className="text-gray-300 mb-4" />
                <p className="text-xl text-gray-500 mb-2">No products found</p>
                <p className="text-gray-400">Try adjusting your filters or search query</p>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                {products.map((product) => (
                  <ProductCard
                    key={product.id}
                    product={product}
                    onAddToCart={handleAddToCart}
                  />
                ))}
              </div>
            )}
          </div>
        </div>
      </main>

      <CartDrawer
        isOpen={isCartOpen}
        onClose={() => setIsCartOpen(false)}
        cartItems={cartItems}
        total={total}
        onUpdateQuantity={updateQuantity}
        onRemoveItem={removeFromCart}
        onCheckout={handleCheckout}
      />

      <CheckoutModal
        isOpen={isCheckoutOpen}
        onClose={() => setIsCheckoutOpen(false)}
        total={total}
        onConfirm={handleConfirmOrder}
      />

      <AuthModal
        isOpen={isAuthOpen}
        onClose={() => setIsAuthOpen(false)}
        onSignUp={signUp}
        onSignIn={signIn}
      />

      <OrdersModal
        isOpen={isOrdersOpen}
        onClose={() => setIsOrdersOpen(false)}
        orders={orders}
        loading={ordersLoading}
      />

      <Footer />
    </div>
  );
}

export default App;
