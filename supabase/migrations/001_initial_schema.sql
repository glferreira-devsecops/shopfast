-- ShopFast Database Schema
-- Execute this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  price NUMERIC(10, 2) NOT NULL,
  stock INTEGER NOT NULL DEFAULT 0,
  image_url TEXT,
  featured BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Cart items table
CREATE TABLE IF NOT EXISTS cart_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  quantity INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(user_id, product_id)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'completed', 'cancelled')),
  total_amount NUMERIC(10, 2) NOT NULL,
  shipping_address JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Order items table
CREATE TABLE IF NOT EXISTS order_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL,
  price_at_purchase NUMERIC(10, 2) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_featured ON products(featured) WHERE featured = TRUE;
CREATE INDEX IF NOT EXISTS idx_cart_items_user ON cart_items(user_id);
CREATE INDEX IF NOT EXISTS idx_orders_user ON orders(user_id);
CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);

-- Row Level Security (RLS)
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE cart_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Categories: Public read
CREATE POLICY "Categories are viewable by everyone" ON categories
  FOR SELECT USING (TRUE);

-- Products: Public read
CREATE POLICY "Products are viewable by everyone" ON products
  FOR SELECT USING (TRUE);

-- Cart items: Users can only see/modify their own
CREATE POLICY "Users can view their own cart items" ON cart_items
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own cart items" ON cart_items
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own cart items" ON cart_items
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own cart items" ON cart_items
  FOR DELETE USING (auth.uid() = user_id);

-- Orders: Users can only see their own
CREATE POLICY "Users can view their own orders" ON orders
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own orders" ON orders
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Order items: Users can only see items from their orders
CREATE POLICY "Users can view their own order items" ON order_items
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_items.order_id
      AND orders.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert order items for their orders" ON order_items
  FOR INSERT WITH CHECK (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_items.order_id
      AND orders.user_id = auth.uid()
    )
  );

-- Insert sample data

-- Categories
INSERT INTO categories (name, slug, description) VALUES
  ('Electronics', 'electronics', 'Electronic devices and gadgets'),
  ('Clothing', 'clothing', 'Fashion and apparel'),
  ('Home & Garden', 'home-garden', 'Home improvement and garden supplies'),
  ('Sports', 'sports', 'Sports equipment and outdoor gear')
ON CONFLICT (slug) DO NOTHING;

-- Products
INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured)
SELECT
  c.id,
  p.name,
  p.slug,
  p.description,
  p.price,
  p.stock,
  p.image_url,
  p.featured
FROM (
  VALUES
    ('Electronics', 'Smartphone Pro X', 'smartphone-pro-x', 'Latest flagship smartphone with advanced camera', 999.99, 50, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9', TRUE),
    ('Electronics', 'Wireless Earbuds', 'wireless-earbuds', 'Premium noise-cancelling earbuds', 199.99, 100, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df', TRUE),
    ('Electronics', 'Laptop Ultra', 'laptop-ultra', 'Powerful laptop for professionals', 1499.99, 30, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853', FALSE),
    ('Clothing', 'Classic T-Shirt', 'classic-tshirt', 'Comfortable cotton t-shirt', 29.99, 200, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab', FALSE),
    ('Clothing', 'Denim Jeans', 'denim-jeans', 'Classic fit denim jeans', 79.99, 150, 'https://images.unsplash.com/photo-1542272604-787c3835535d', TRUE),
    ('Home & Garden', 'Smart Home Hub', 'smart-home-hub', 'Control all your smart devices', 149.99, 75, 'https://images.unsplash.com/photo-1558089687-f282ffcbc126', FALSE),
    ('Sports', 'Yoga Mat Pro', 'yoga-mat-pro', 'Premium non-slip yoga mat', 49.99, 120, 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f', FALSE),
    ('Sports', 'Running Shoes', 'running-shoes', 'Lightweight performance running shoes', 129.99, 80, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', TRUE)
) AS p(category_name, name, slug, description, price, stock, image_url, featured)
JOIN categories c ON c.name = p.category_name
ON CONFLICT (slug) DO NOTHING;
