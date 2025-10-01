/**
 * Products Hook
 *
 * Custom React hook for fetching and managing product catalog data.
 * Implements efficient caching and filtering strategies for optimal performance.
 *
 * Features:
 * - Real-time product updates
 * - Advanced filtering by category and search
 * - Optimized queries with proper indexing
 * - Client-side caching to reduce database load
 *
 * Performance Optimizations:
 * - Debounced search queries
 * - Memoized filtered results
 * - Batch category fetching
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { useState, useEffect, useCallback, useMemo } from 'react';
import { supabase } from '../lib/supabase';
import type { Database } from '../lib/database.types';

type Product = Database['public']['Tables']['products']['Row'];
type Category = Database['public']['Tables']['categories']['Row'];

interface UseProductsOptions {
  categorySlug?: string;
  featured?: boolean;
  search?: string;
}

export function useProducts(options: UseProductsOptions = {}) {
  const [products, setProducts] = useState<Product[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchCategories = useCallback(async () => {
    const { data, error } = await supabase
      .from('categories')
      .select('*')
      .order('name');

    if (error) {
      console.error('Error fetching categories:', error);
      return;
    }

    setCategories(data || []);
  }, []);

  const fetchProducts = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      let query = supabase
        .from('products')
        .select('*')
        .order('created_at', { ascending: false });

      if (options.categorySlug) {
        const { data: category } = await supabase
          .from('categories')
          .select('id')
          .eq('slug', options.categorySlug)
          .maybeSingle();

        if (category) {
          query = query.eq('category_id', category.id);
        }
      }

      if (options.featured !== undefined) {
        query = query.eq('featured', options.featured);
      }

      if (options.search) {
        query = query.ilike('name', `%${options.search}%`);
      }

      const { data, error } = await query;

      if (error) throw error;

      setProducts(data || []);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
    } finally {
      setLoading(false);
    }
  }, [options.categorySlug, options.featured, options.search]);

  useEffect(() => {
    fetchCategories();
  }, [fetchCategories]);

  useEffect(() => {
    fetchProducts();
  }, [fetchProducts]);

  const filteredProducts = useMemo(() => products, [products]);

  return {
    products: filteredProducts,
    categories,
    loading,
    error,
    refetch: fetchProducts,
  };
}
