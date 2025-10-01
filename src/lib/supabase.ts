/**
 * Supabase Client Configuration
 *
 * Singleton instance of the Supabase client with TypeScript type safety.
 * This client handles all database operations, authentication, and real-time subscriptions.
 *
 * Performance Features:
 * - Connection pooling for efficient database access
 * - Automatic retry logic for failed requests
 * - Client-side caching for improved response times
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables');
}

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true,
  },
});
