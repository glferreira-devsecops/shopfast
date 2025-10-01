-- =====================================================
-- ShopFast E-commerce - Comprehensive Seed Data
-- =====================================================
-- This script populates the database with realistic product data
-- Categories: Electronics, Fashion, Home & Garden, Sports, Books
-- =====================================================

-- Clear existing data (for clean seeding)
TRUNCATE TABLE order_items CASCADE;
TRUNCATE TABLE orders CASCADE;
TRUNCATE TABLE cart_items CASCADE;
TRUNCATE TABLE products CASCADE;
TRUNCATE TABLE categories CASCADE;

-- =====================================================
-- CATEGORIES
-- =====================================================

INSERT INTO categories (id, name, slug, description) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Electronics', 'electronics', 'Latest technology and electronic devices'),
  ('22222222-2222-2222-2222-222222222222', 'Fashion', 'fashion', 'Trending fashion and apparel'),
  ('33333333-3333-3333-3333-333333333333', 'Home & Garden', 'home-garden', 'Everything for your home and garden'),
  ('44444444-4444-4444-4444-444444444444', 'Sports & Outdoors', 'sports-outdoors', 'Sports equipment and outdoor gear'),
  ('55555555-5555-5555-5555-555555555555', 'Books & Media', 'books-media', 'Books, movies, and entertainment');

-- =====================================================
-- ELECTRONICS PRODUCTS
-- =====================================================

INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured) VALUES
  -- Smartphones
  ('11111111-1111-1111-1111-111111111111', 'iPhone 15 Pro Max', 'iphone-15-pro-max', 'Latest flagship iPhone with A17 Pro chip, titanium design, and advanced camera system. 256GB storage, 5G enabled.', 1299.99, 50, 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500&h=500&fit=crop', true),
  ('11111111-1111-1111-1111-111111111111', 'Samsung Galaxy S24 Ultra', 'samsung-galaxy-s24-ultra', 'Premium Android flagship with AI features, S Pen, and 200MP camera. 512GB storage, stunning display.', 1199.99, 45, 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500&h=500&fit=crop', true),
  ('11111111-1111-1111-1111-111111111111', 'Google Pixel 8 Pro', 'google-pixel-8-pro', 'Pure Android experience with Google Tensor G3 chip and exceptional computational photography.', 999.99, 60, 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500&h=500&fit=crop', false),

  -- Laptops
  ('11111111-1111-1111-1111-111111111111', 'MacBook Pro 16" M3 Max', 'macbook-pro-16-m3-max', 'Professional laptop with M3 Max chip, 36GB RAM, 1TB SSD. Perfect for developers and creators.', 3499.99, 25, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&h=500&fit=crop', true),
  ('11111111-1111-1111-1111-111111111111', 'Dell XPS 15 (2024)', 'dell-xps-15-2024', 'Ultra-thin laptop with Intel Core i9, 32GB RAM, NVIDIA RTX 4060. 4K OLED display.', 2299.99, 35, 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&h=500&fit=crop', false),
  ('11111111-1111-1111-1111-111111111111', 'Lenovo ThinkPad X1 Carbon Gen 11', 'lenovo-thinkpad-x1-carbon', 'Business ultrabook with legendary keyboard, Intel vPro, and military-grade durability.', 1899.99, 40, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=500&h=500&fit=crop', false),

  -- Audio
  ('11111111-1111-1111-1111-111111111111', 'Sony WH-1000XM5', 'sony-wh-1000xm5', 'Industry-leading noise canceling wireless headphones with 30-hour battery life and premium sound.', 399.99, 80, 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500&h=500&fit=crop', true),
  ('11111111-1111-1111-1111-111111111111', 'AirPods Pro (2nd Gen)', 'airpods-pro-2nd-gen', 'Active noise cancellation, adaptive audio, and personalized spatial audio with dynamic head tracking.', 249.99, 100, 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=500&h=500&fit=crop', false),
  ('11111111-1111-1111-1111-111111111111', 'Bose QuietComfort Ultra', 'bose-quietcomfort-ultra', 'Premium comfort and world-class noise cancellation with immersive spatial audio.', 429.99, 55, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&h=500&fit=crop', false),

  -- Tablets & Accessories
  ('11111111-1111-1111-1111-111111111111', 'iPad Pro 12.9" M2', 'ipad-pro-129-m2', 'Most powerful iPad with M2 chip, Liquid Retina XDR display, and Apple Pencil support.', 1099.99, 45, 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500&h=500&fit=crop', false),
  ('11111111-1111-1111-1111-111111111111', 'Samsung Galaxy Tab S9 Ultra', 'samsung-galaxy-tab-s9-ultra', 'Android tablet with 14.6" AMOLED display, S Pen included, perfect for productivity.', 1199.99, 30, 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=500&h=500&fit=crop', false),

  -- Smart Home
  ('11111111-1111-1111-1111-111111111111', 'Amazon Echo Show 15', 'amazon-echo-show-15', 'Smart display with Alexa, 15.6" Full HD screen, perfect smart home control center.', 279.99, 70, 'https://images.unsplash.com/photo-1558089687-e1c6e3919e4b?w=500&h=500&fit=crop', false),
  ('11111111-1111-1111-1111-111111111111', 'Google Nest Hub Max', 'google-nest-hub-max', '10" smart display with Google Assistant, built-in Nest Cam, and premium sound.', 229.99, 65, 'https://images.unsplash.com/photo-1558002038-1055907df827?w=500&h=500&fit=crop', false);

-- =====================================================
-- FASHION PRODUCTS
-- =====================================================

INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured) VALUES
  -- Men's Clothing
  ('22222222-2222-2222-2222-222222222222', 'Classic Oxford Shirt - White', 'classic-oxford-shirt-white', 'Premium cotton oxford shirt, perfect for business casual. Wrinkle-resistant, breathable fabric.', 79.99, 120, 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'Slim Fit Chinos - Navy', 'slim-fit-chinos-navy', 'Modern fit chino pants with stretch comfort. Versatile for work or casual wear.', 89.99, 150, 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'Premium Leather Jacket', 'premium-leather-jacket', 'Genuine leather jacket with classic biker style. Timeless design, superior craftsmanship.', 399.99, 45, 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500&h=500&fit=crop', true),

  -- Women's Clothing
  ('22222222-2222-2222-2222-222222222222', 'Floral Summer Dress', 'floral-summer-dress', 'Light and breezy floral print dress, perfect for warm weather. Flattering A-line silhouette.', 129.99, 85, 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&h=500&fit=crop', true),
  ('22222222-2222-2222-2222-222222222222', 'Cashmere Blend Sweater', 'cashmere-blend-sweater', 'Luxuriously soft cashmere blend sweater in classic crewneck style. Available in 8 colors.', 159.99, 95, 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'High-Waisted Jeans', 'high-waisted-jeans', 'Classic high-waisted denim jeans with stretch. Flattering fit, premium denim quality.', 99.99, 110, 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500&h=500&fit=crop', false),

  -- Shoes
  ('22222222-2222-2222-2222-222222222222', 'Nike Air Max 2024', 'nike-air-max-2024', 'Latest Air Max technology with sustainable materials. Maximum comfort and style.', 179.99, 200, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop', true),
  ('22222222-2222-2222-2222-222222222222', 'Adidas Ultraboost 23', 'adidas-ultraboost-23', 'Premium running shoes with responsive Boost cushioning and continental rubber outsole.', 189.99, 180, 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'Chelsea Boots - Brown Leather', 'chelsea-boots-brown', 'Timeless Chelsea boots in premium brown leather. Comfortable elastic side panels.', 249.99, 75, 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=500&h=500&fit=crop', false),

  -- Accessories
  ('22222222-2222-2222-2222-222222222222', 'Designer Sunglasses', 'designer-sunglasses', 'UV400 protection polarized sunglasses with premium acetate frame. Includes case and cloth.', 199.99, 130, 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'Leather Belt - Italian Craftsmanship', 'italian-leather-belt', 'Full-grain Italian leather belt with solid brass buckle. Handcrafted quality.', 89.99, 160, 'https://images.unsplash.com/photo-1624222247344-550fb60583c3?w=500&h=500&fit=crop', false),
  ('22222222-2222-2222-2222-222222222222', 'Luxury Watch - Automatic', 'luxury-automatic-watch', 'Swiss-inspired automatic movement watch with sapphire crystal and stainless steel case.', 599.99, 40, 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=500&h=500&fit=crop', true);

-- =====================================================
-- HOME & GARDEN PRODUCTS
-- =====================================================

INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured) VALUES
  -- Furniture
  ('33333333-3333-3333-3333-333333333333', 'Modern Velvet Sofa', 'modern-velvet-sofa', 'Luxurious 3-seater velvet sofa with deep cushions and solid wood frame. Available in 6 colors.', 1299.99, 20, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500&h=500&fit=crop', true),
  ('33333333-3333-3333-3333-333333333333', 'Scandinavian Dining Table', 'scandinavian-dining-table', 'Minimalist oak dining table, seats 6-8 people. Sustainable wood with natural finish.', 899.99, 15, 'https://images.unsplash.com/photo-1617806118233-18e1de247200?w=500&h=500&fit=crop', false),
  ('33333333-3333-3333-3333-333333333333', 'Ergonomic Office Chair', 'ergonomic-office-chair', 'Premium mesh office chair with lumbar support, adjustable armrests, and tilt mechanism.', 449.99, 55, 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=500&h=500&fit=crop', true),

  -- Bedroom
  ('33333333-3333-3333-3333-333333333333', 'Memory Foam Mattress - Queen', 'memory-foam-mattress-queen', 'Premium memory foam mattress with cooling gel layer. 10-year warranty, CertiPUR-US certified.', 799.99, 30, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500&h=500&fit=crop', false),
  ('33333333-3333-3333-3333-333333333333', 'Egyptian Cotton Sheet Set', 'egyptian-cotton-sheets', 'Luxury 800 thread count Egyptian cotton sheets. Includes fitted sheet, flat sheet, and pillowcases.', 179.99, 90, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=500&h=500&fit=crop', false),

  -- Kitchen
  ('33333333-3333-3333-3333-333333333333', 'KitchenAid Stand Mixer', 'kitchenaid-stand-mixer', 'Professional 5-quart stand mixer with 10 speeds. Includes whisk, dough hook, and flat beater.', 429.99, 45, 'https://images.unsplash.com/photo-1570222094114-d054a817e56b?w=500&h=500&fit=crop', true),
  ('33333333-3333-3333-3333-333333333333', 'Stainless Steel Cookware Set', 'stainless-steel-cookware-set', '12-piece professional cookware set with copper core. Dishwasher safe, lifetime warranty.', 599.99, 35, 'https://images.unsplash.com/photo-1584990347449-39b34d837e61?w=500&h=500&fit=crop', false),
  ('33333333-3333-3333-3333-333333333333', 'Ninja Air Fryer Max XL', 'ninja-air-fryer-max-xl', 'Extra-large air fryer with 5.5L capacity. 7-in-1 functionality: air fry, roast, broil, dehydrate.', 179.99, 80, 'https://images.unsplash.com/photo-1585515320310-259814833e62?w=500&h=500&fit=crop', false),

  -- Decor
  ('33333333-3333-3333-3333-333333333333', 'Handwoven Area Rug 8x10', 'handwoven-area-rug', 'Beautiful handwoven wool area rug with geometric pattern. Fair trade, sustainable materials.', 599.99, 25, 'https://images.unsplash.com/photo-1600166898405-da9535204843?w=500&h=500&fit=crop', false),
  ('33333333-3333-3333-3333-333333333333', 'Modern Floor Lamp', 'modern-floor-lamp', 'Minimalist arc floor lamp with marble base. Adjustable height, LED compatible.', 249.99, 60, 'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=500&h=500&fit=crop', false),

  -- Garden
  ('33333333-3333-3333-3333-333333333333', 'Outdoor Patio Set', 'outdoor-patio-set', 'Weather-resistant wicker patio set with 4 chairs and coffee table. UV-protected cushions.', 899.99, 18, 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?w=500&h=500&fit=crop', false),
  ('33333333-3333-3333-3333-333333333333', 'Smart Garden System', 'smart-garden-system', 'Indoor hydroponic garden with LED grow lights. Grow herbs and vegetables year-round.', 199.99, 50, 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?w=500&h=500&fit=crop', false);

-- =====================================================
-- SPORTS & OUTDOORS PRODUCTS
-- =====================================================

INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured) VALUES
  -- Fitness Equipment
  ('44444444-4444-4444-4444-444444444444', 'Adjustable Dumbbell Set', 'adjustable-dumbbell-set', 'Space-saving adjustable dumbbells, 5-52.5 lbs per dumbbell. Quick weight adjustment system.', 349.99, 65, 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=500&h=500&fit=crop', true),
  ('44444444-4444-4444-4444-444444444444', 'Professional Yoga Mat', 'professional-yoga-mat', 'Extra-thick 6mm yoga mat with superior grip. Eco-friendly TPE material, includes carrying strap.', 79.99, 150, 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500&h=500&fit=crop', false),
  ('44444444-4444-4444-4444-444444444444', 'Resistance Bands Set', 'resistance-bands-set', 'Premium resistance bands with 5 resistance levels. Includes door anchor, handles, and ankle straps.', 49.99, 200, 'https://images.unsplash.com/photo-1598289431512-b97b0917affc?w=500&h=500&fit=crop', false),

  -- Cycling
  ('44444444-4444-4444-4444-444444444444', 'Mountain Bike - 29" Carbon', 'mountain-bike-carbon', 'Professional carbon frame mountain bike with Shimano XT groupset. Full suspension, disc brakes.', 2499.99, 12, 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?w=500&h=500&fit=crop', true),
  ('44444444-4444-4444-4444-444444444444', 'Road Bike - Lightweight Aluminum', 'road-bike-aluminum', 'Aerodynamic road bike with 16-speed Shimano groupset. Perfect for long-distance riding.', 1299.99, 18, 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=500&h=500&fit=crop', false),

  -- Camping & Hiking
  ('44444444-4444-4444-4444-444444444444', '4-Season Camping Tent', '4-season-camping-tent', 'Professional 4-season tent for 2 people. Waterproof, windproof, includes footprint and stakes.', 459.99, 35, 'https://images.unsplash.com/photo-1478131143081-80f7f84ca84d?w=500&h=500&fit=crop', false),
  ('44444444-4444-4444-4444-444444444444', 'Hiking Backpack 65L', 'hiking-backpack-65l', 'Professional hiking backpack with adjustable suspension system. Hydration compatible, rain cover.', 229.99, 70, 'https://images.unsplash.com/photo-1622260614153-03223fb72052?w=500&h=500&fit=crop', true),
  ('44444444-4444-4444-4444-444444444444', 'Sleeping Bag -20°F', 'sleeping-bag-winter', 'Down-filled sleeping bag rated to -20°F. Lightweight, compressible, water-resistant shell.', 299.99, 55, 'https://images.unsplash.com/photo-1541672107676-d4e79a9e9100?w=500&h=500&fit=crop', false),

  -- Water Sports
  ('44444444-4444-4444-4444-444444444444', 'Inflatable Paddleboard', 'inflatable-paddleboard', 'Durable inflatable SUP board with accessories. Includes pump, paddle, leash, and backpack.', 599.99, 40, 'https://images.unsplash.com/photo-1505142468610-359e7d316be0?w=500&h=500&fit=crop', false),
  ('44444444-4444-4444-4444-444444444444', 'Kayak - Single Sit-On-Top', 'kayak-single', 'Stable recreational kayak perfect for beginners. UV-resistant polyethylene, includes paddle.', 499.99, 25, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=500&h=500&fit=crop', false),

  -- Running
  ('44444444-4444-4444-4444-444444444444', 'GPS Running Watch', 'gps-running-watch', 'Advanced GPS watch with heart rate monitor, VO2 max, and training plans. 7-day battery life.', 449.99, 85, 'https://images.unsplash.com/photo-1523395243481-163f8f6155ab?w=500&h=500&fit=crop', true),
  ('44444444-4444-4444-4444-444444444444', 'Running Hydration Vest', 'running-hydration-vest', 'Lightweight hydration vest with multiple pockets. Fits 2L bladder, bounce-free design.', 89.99, 110, 'https://images.unsplash.com/photo-1556906918-4b6d09e18151?w=500&h=500&fit=crop', false);

-- =====================================================
-- BOOKS & MEDIA PRODUCTS
-- =====================================================

INSERT INTO products (category_id, name, slug, description, price, stock, image_url, featured) VALUES
  -- Fiction
  ('55555555-5555-5555-5555-555555555555', 'The Midnight Library', 'midnight-library', 'Bestselling novel by Matt Haig about parallel lives and infinite possibilities. Hardcover edition.', 27.99, 200, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=500&h=500&fit=crop', true),
  ('55555555-5555-5555-5555-555555555555', 'Project Hail Mary', 'project-hail-mary', 'Science fiction thriller by Andy Weir. A lone astronaut must save Earth. Paperback edition.', 18.99, 180, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500&h=500&fit=crop', false),

  -- Non-Fiction
  ('55555555-5555-5555-5555-555555555555', 'Atomic Habits', 'atomic-habits', 'James Clear''''s transformative guide to building good habits and breaking bad ones. #1 Bestseller.', 24.99, 250, 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?w=500&h=500&fit=crop', true),
  ('55555555-5555-5555-5555-555555555555', 'Sapiens: A Brief History', 'sapiens-brief-history', 'Yuval Noah Harari''''s groundbreaking exploration of human history. International bestseller.', 22.99, 220, 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500&h=500&fit=crop', false),

  -- Technology
  ('55555555-5555-5555-5555-555555555555', 'Clean Code', 'clean-code', 'Robert C. Martin''''s handbook of agile software craftsmanship. Essential for developers.', 44.99, 140, 'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=500&h=500&fit=crop', true),
  ('55555555-5555-5555-5555-555555555555', 'The Pragmatic Programmer', 'pragmatic-programmer', '20th anniversary edition. Your journey to mastery in software development.', 49.99, 130, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=500&h=500&fit=crop', false),

  -- Self-Help
  ('55555555-5555-5555-5555-555555555555', 'The Power of Now', 'power-of-now', 'Eckhart Tolle''''s spiritual guide to enlightenment and living in the present moment.', 19.99, 190, 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500&h=500&fit=crop', false),
  ('55555555-5555-5555-5555-555555555555', 'Can''''t Hurt Me', 'cant-hurt-me', 'David Goggins'''' memoir about mastering your mind and defying the odds. Motivational masterpiece.', 26.99, 170, 'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=500&h=500&fit=crop', false),

  -- Comics & Graphic Novels
  ('55555555-5555-5555-5555-555555555555', 'Sandman Vol. 1', 'sandman-vol-1', 'Neil Gaiman''''s legendary graphic novel series. Deluxe hardcover edition with bonus content.', 39.99, 95, 'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=500&h=500&fit=crop', false),
  ('55555555-5555-5555-5555-555555555555', 'Watchmen', 'watchmen', 'Alan Moore''''s masterpiece graphic novel. Absolute edition with enhanced artwork and extras.', 49.99, 80, 'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?w=500&h=500&fit=crop', true),

  -- Educational
  ('55555555-5555-5555-5555-555555555555', 'Learning Python', 'learning-python', 'Comprehensive guide to Python programming. 5th edition with Python 3.9 updates.', 59.99, 120, 'https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?w=500&h=500&fit=crop', false),
  ('55555555-5555-5555-5555-555555555555', 'Design Patterns', 'design-patterns', 'Elements of reusable object-oriented software. The classic programming reference book.', 54.99, 100, 'https://images.unsplash.com/photo-1533279443086-d1c19a186416?w=500&h=500&fit=crop', false);

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

-- Verify category count
SELECT 'Categories' as table_name, COUNT(*) as count FROM categories
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Featured Products', COUNT(*) FROM products WHERE featured = true;

-- Verify products per category
SELECT
  c.name as category_name,
  COUNT(p.id) as product_count,
  ROUND(AVG(p.price), 2) as avg_price,
  SUM(p.stock) as total_stock
FROM categories c
LEFT JOIN products p ON p.category_id = c.id
GROUP BY c.id, c.name
ORDER BY c.name;

-- Show sample products
SELECT
  c.name as category,
  p.name as product,
  p.price,
  p.stock,
  p.featured
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE p.featured = true
ORDER BY c.name, p.price DESC;
