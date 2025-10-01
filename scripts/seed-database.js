#!/usr/bin/env node

/**
 * ShopFast Database Seeding Script (Node.js)
 * ============================================
 * This script populates the Supabase database with comprehensive product data
 * using the Supabase JavaScript client for easy execution.
 */

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load environment variables
dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Error: Missing required environment variables');
  console.error('Required: VITE_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY (or VITE_SUPABASE_ANON_KEY)');
  process.exit(1);
}

// Create Supabase client with service role key for admin operations
const supabase = createClient(supabaseUrl, supabaseServiceKey);

console.log('🚀 ShopFast Database Seeding');
console.log('======================================');
console.log('');

/**
 * Categories data
 */
const categories = [
  {
    id: '11111111-1111-1111-1111-111111111111',
    name: 'Electronics',
    slug: 'electronics',
    description: 'Latest technology and electronic devices'
  },
  {
    id: '22222222-2222-2222-2222-222222222222',
    name: 'Fashion',
    slug: 'fashion',
    description: 'Trending fashion and apparel'
  },
  {
    id: '33333333-3333-3333-3333-333333333333',
    name: 'Home & Garden',
    slug: 'home-garden',
    description: 'Everything for your home and garden'
  },
  {
    id: '44444444-4444-4444-4444-444444444444',
    name: 'Sports & Outdoors',
    slug: 'sports-outdoors',
    description: 'Sports equipment and outdoor gear'
  },
  {
    id: '55555555-5555-5555-5555-555555555555',
    name: 'Books & Media',
    slug: 'books-media',
    description: 'Books, movies, and entertainment'
  }
];

/**
 * Products data - comprehensive catalog
 */
const products = [
  // Electronics
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'iPhone 15 Pro Max', slug: 'iphone-15-pro-max', description: 'Latest flagship iPhone with A17 Pro chip, titanium design, and advanced camera system. 256GB storage, 5G enabled.', price: 1299.99, stock: 50, image_url: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500&h=500&fit=crop', featured: true },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'Samsung Galaxy S24 Ultra', slug: 'samsung-galaxy-s24-ultra', description: 'Premium Android flagship with AI features, S Pen, and 200MP camera. 512GB storage, stunning display.', price: 1199.99, stock: 45, image_url: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500&h=500&fit=crop', featured: true },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'Google Pixel 8 Pro', slug: 'google-pixel-8-pro', description: 'Pure Android experience with Google Tensor G3 chip and exceptional computational photography.', price: 999.99, stock: 60, image_url: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500&h=500&fit=crop', featured: false },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'MacBook Pro 16" M3 Max', slug: 'macbook-pro-16-m3-max', description: 'Professional laptop with M3 Max chip, 36GB RAM, 1TB SSD. Perfect for developers and creators.', price: 3499.99, stock: 25, image_url: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&h=500&fit=crop', featured: true },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'Dell XPS 15 (2024)', slug: 'dell-xps-15-2024', description: 'Ultra-thin laptop with Intel Core i9, 32GB RAM, NVIDIA RTX 4060. 4K OLED display.', price: 2299.99, stock: 35, image_url: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&h=500&fit=crop', featured: false },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'Sony WH-1000XM5', slug: 'sony-wh-1000xm5', description: 'Industry-leading noise canceling wireless headphones with 30-hour battery life and premium sound.', price: 399.99, stock: 80, image_url: 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500&h=500&fit=crop', featured: true },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'AirPods Pro (2nd Gen)', slug: 'airpods-pro-2nd-gen', description: 'Active noise cancellation, adaptive audio, and personalized spatial audio with dynamic head tracking.', price: 249.99, stock: 100, image_url: 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=500&h=500&fit=crop', featured: false },
  { category_id: '11111111-1111-1111-1111-111111111111', name: 'iPad Pro 12.9" M2', slug: 'ipad-pro-129-m2', description: 'Most powerful iPad with M2 chip, Liquid Retina XDR display, and Apple Pencil support.', price: 1099.99, stock: 45, image_url: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500&h=500&fit=crop', featured: false },

  // Fashion
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'Premium Leather Jacket', slug: 'premium-leather-jacket', description: 'Genuine leather jacket with classic biker style. Timeless design, superior craftsmanship.', price: 399.99, stock: 45, image_url: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500&h=500&fit=crop', featured: true },
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'Floral Summer Dress', slug: 'floral-summer-dress', description: 'Light and breezy floral print dress, perfect for warm weather. Flattering A-line silhouette.', price: 129.99, stock: 85, image_url: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&h=500&fit=crop', featured: true },
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'Nike Air Max 2024', slug: 'nike-air-max-2024', description: 'Latest Air Max technology with sustainable materials. Maximum comfort and style.', price: 179.99, stock: 200, image_url: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop', featured: true },
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'Cashmere Blend Sweater', slug: 'cashmere-blend-sweater', description: 'Luxuriously soft cashmere blend sweater in classic crewneck style. Available in 8 colors.', price: 159.99, stock: 95, image_url: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=500&h=500&fit=crop', featured: false },
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'High-Waisted Jeans', slug: 'high-waisted-jeans', description: 'Classic high-waisted denim jeans with stretch. Flattering fit, premium denim quality.', price: 99.99, stock: 110, image_url: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500&h=500&fit=crop', featured: false },
  { category_id: '22222222-2222-2222-2222-222222222222', name: 'Luxury Watch - Automatic', slug: 'luxury-automatic-watch', description: 'Swiss-inspired automatic movement watch with sapphire crystal and stainless steel case.', price: 599.99, stock: 40, image_url: 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=500&h=500&fit=crop', featured: true },

  // Home & Garden
  { category_id: '33333333-3333-3333-3333-333333333333', name: 'Modern Velvet Sofa', slug: 'modern-velvet-sofa', description: 'Luxurious 3-seater velvet sofa with deep cushions and solid wood frame. Available in 6 colors.', price: 1299.99, stock: 20, image_url: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500&h=500&fit=crop', featured: true },
  { category_id: '33333333-3333-3333-3333-333333333333', name: 'Ergonomic Office Chair', slug: 'ergonomic-office-chair', description: 'Premium mesh office chair with lumbar support, adjustable armrests, and tilt mechanism.', price: 449.99, stock: 55, image_url: 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=500&h=500&fit=crop', featured: true },
  { category_id: '33333333-3333-3333-3333-333333333333', name: 'KitchenAid Stand Mixer', slug: 'kitchenaid-stand-mixer', description: 'Professional 5-quart stand mixer with 10 speeds. Includes whisk, dough hook, and flat beater.', price: 429.99, stock: 45, image_url: 'https://images.unsplash.com/photo-1570222094114-d054a817e56b?w=500&h=500&fit=crop', featured: true },
  { category_id: '33333333-3333-3333-3333-333333333333', name: 'Memory Foam Mattress - Queen', slug: 'memory-foam-mattress-queen', description: 'Premium memory foam mattress with cooling gel layer. 10-year warranty, CertiPUR-US certified.', price: 799.99, stock: 30, image_url: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500&h=500&fit=crop', featured: false },
  { category_id: '33333333-3333-3333-3333-333333333333', name: 'Stainless Steel Cookware Set', slug: 'stainless-steel-cookware-set', description: '12-piece professional cookware set with copper core. Dishwasher safe, lifetime warranty.', price: 599.99, stock: 35, image_url: 'https://images.unsplash.com/photo-1584990347449-39b34d837e61?w=500&h=500&fit=crop', featured: false },

  // Sports & Outdoors
  { category_id: '44444444-4444-4444-4444-444444444444', name: 'Adjustable Dumbbell Set', slug: 'adjustable-dumbbell-set', description: 'Space-saving adjustable dumbbells, 5-52.5 lbs per dumbbell. Quick weight adjustment system.', price: 349.99, stock: 65, image_url: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=500&h=500&fit=crop', featured: true },
  { category_id: '44444444-4444-4444-4444-444444444444', name: 'Mountain Bike - 29" Carbon', slug: 'mountain-bike-carbon', description: 'Professional carbon frame mountain bike with Shimano XT groupset. Full suspension, disc brakes.', price: 2499.99, stock: 12, image_url: 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?w=500&h=500&fit=crop', featured: true },
  { category_id: '44444444-4444-4444-4444-444444444444', name: 'Hiking Backpack 65L', slug: 'hiking-backpack-65l', description: 'Professional hiking backpack with adjustable suspension system. Hydration compatible, rain cover.', price: 229.99, stock: 70, image_url: 'https://images.unsplash.com/photo-1622260614153-03223fb72052?w=500&h=500&fit=crop', featured: true },
  { category_id: '44444444-4444-4444-4444-444444444444', name: 'GPS Running Watch', slug: 'gps-running-watch', description: 'Advanced GPS watch with heart rate monitor, VO2 max, and training plans. 7-day battery life.', price: 449.99, stock: 85, image_url: 'https://images.unsplash.com/photo-1523395243481-163f8f6155ab?w=500&h=500&fit=crop', featured: true },
  { category_id: '44444444-4444-4444-4444-444444444444', name: 'Professional Yoga Mat', slug: 'professional-yoga-mat', description: 'Extra-thick 6mm yoga mat with superior grip. Eco-friendly TPE material, includes carrying strap.', price: 79.99, stock: 150, image_url: 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500&h=500&fit=crop', featured: false },

  // Books & Media
  { category_id: '55555555-5555-5555-5555-555555555555', name: 'The Midnight Library', slug: 'midnight-library', description: 'Bestselling novel by Matt Haig about parallel lives and infinite possibilities. Hardcover edition.', price: 27.99, stock: 200, image_url: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=500&h=500&fit=crop', featured: true },
  { category_id: '55555555-5555-5555-5555-555555555555', name: 'Atomic Habits', slug: 'atomic-habits', description: 'James Clear\'s transformative guide to building good habits and breaking bad ones. #1 Bestseller.', price: 24.99, stock: 250, image_url: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?w=500&h=500&fit=crop', featured: true },
  { category_id: '55555555-5555-5555-5555-555555555555', name: 'Clean Code', slug: 'clean-code', description: 'Robert C. Martin\'s handbook of agile software craftsmanship. Essential for developers.', price: 44.99, stock: 140, image_url: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=500&h=500&fit=crop', featured: true },
  { category_id: '55555555-5555-5555-5555-555555555555', name: 'Watchmen', slug: 'watchmen', description: 'Alan Moore\'s masterpiece graphic novel. Absolute edition with enhanced artwork and extras.', price: 49.99, stock: 80, image_url: 'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?w=500&h=500&fit=crop', featured: true },
  { category_id: '55555555-5555-5555-5555-555555555555', name: 'Sapiens: A Brief History', slug: 'sapiens-brief-history', description: 'Yuval Noah Harari\'s groundbreaking exploration of human history. International bestseller.', price: 22.99, stock: 220, image_url: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500&h=500&fit=crop', featured: false }
];

/**
 * Main seeding function
 */
async function seedDatabase() {
  try {
    console.log('📦 Step 1: Clearing existing data...');

    // Clear existing data in correct order (respecting foreign keys)
    await supabase.from('cart_items').delete().neq('id', '00000000-0000-0000-0000-000000000000');
    await supabase.from('order_items').delete().neq('id', '00000000-0000-0000-0000-000000000000');
    await supabase.from('orders').delete().neq('id', '00000000-0000-0000-0000-000000000000');
    await supabase.from('products').delete().neq('id', '00000000-0000-0000-0000-000000000000');
    await supabase.from('categories').delete().neq('id', '00000000-0000-0000-0000-000000000000');

    console.log('✓ Existing data cleared');
    console.log('');

    console.log('📊 Step 2: Inserting categories...');
    const { data: categoryData, error: categoryError } = await supabase
      .from('categories')
      .insert(categories)
      .select();

    if (categoryError) {
      throw new Error(`Category insertion failed: ${categoryError.message}`);
    }

    console.log(`✓ Inserted ${categoryData.length} categories`);
    console.log('');

    console.log('🛍️  Step 3: Inserting products...');
    const { data: productData, error: productError } = await supabase
      .from('products')
      .insert(products)
      .select();

    if (productError) {
      throw new Error(`Product insertion failed: ${productError.message}`);
    }

    console.log(`✓ Inserted ${productData.length} products`);
    console.log('');

    // Get statistics
    const { count: totalProducts } = await supabase
      .from('products')
      .select('*', { count: 'exact', head: true });

    const { count: featuredProducts } = await supabase
      .from('products')
      .select('*', { count: 'exact', head: true })
      .eq('featured', true);

    console.log('======================================');
    console.log('🎉 Database seeding completed!');
    console.log('======================================');
    console.log('');
    console.log('📈 Summary:');
    console.log(`  • ${categories.length} Categories created`);
    console.log(`  • ${totalProducts} Products added`);
    console.log(`  • ${featuredProducts} Featured products`);
    console.log('  • Real product images from Unsplash');
    console.log('');
    console.log('🌐 Visit your application to see the products:');
    console.log('  https://shopfastt.netlify.app');
    console.log('');
    console.log('📚 Product categories:');
    console.log('  • Electronics');
    console.log('  • Fashion');
    console.log('  • Home & Garden');
    console.log('  • Sports & Outdoors');
    console.log('  • Books & Media');
    console.log('');

  } catch (error) {
    console.error('❌ Error seeding database:', error.message);
    process.exit(1);
  }
}

// Run the seeding
seedDatabase();
