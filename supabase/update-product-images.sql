-- =====================================================
-- Update Product Images with Accurate Photos
-- =====================================================
-- This updates all product images to be more accurate and specific
-- Using high-quality Unsplash images that match product descriptions
-- =====================================================

-- ELECTRONICS - Smartphones
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1696446702331-da585f9aad2b?w=500&h=500&fit=crop&q=80' WHERE slug = 'iphone-15-pro-max';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500&h=500&fit=crop&q=80' WHERE slug = 'samsung-galaxy-s24-ultra';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500&h=500&fit=crop&q=80' WHERE slug = 'google-pixel-8-pro';

-- ELECTRONICS - Laptops
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&h=500&fit=crop&q=80' WHERE slug = 'macbook-pro-16-m3-max';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&h=500&fit=crop&q=80' WHERE slug = 'dell-xps-15-2024';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=500&h=500&fit=crop&q=80' WHERE slug = 'lenovo-thinkpad-x1-carbon';

-- ELECTRONICS - Audio
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500&h=500&fit=crop&q=80' WHERE slug = 'sony-wh-1000xm5';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=500&h=500&fit=crop&q=80' WHERE slug = 'airpods-pro-2nd-gen';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&h=500&fit=crop&q=80' WHERE slug = 'bose-quietcomfort-ultra';

-- ELECTRONICS - Tablets
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500&h=500&fit=crop&q=80' WHERE slug = 'ipad-pro-129-m2';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=500&h=500&fit=crop&q=80' WHERE slug = 'samsung-galaxy-tab-s9-ultra';

-- ELECTRONICS - Smart Home
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1543512214-318c7553f230?w=500&h=500&fit=crop&q=80' WHERE slug = 'amazon-echo-show-15';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1543512214-318c7553f230?w=500&h=500&fit=crop&q=80' WHERE slug = 'google-nest-hub-max';

-- FASHION - Men's Clothing
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=500&h=500&fit=crop&q=80' WHERE slug = 'classic-oxford-shirt-white';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=500&h=500&fit=crop&q=80' WHERE slug = 'slim-fit-chinos-navy';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500&h=500&fit=crop&q=80' WHERE slug = 'premium-leather-jacket';

-- FASHION - Women's Clothing
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&h=500&fit=crop&q=80' WHERE slug = 'floral-summer-dress';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=500&h=500&fit=crop&q=80' WHERE slug = 'cashmere-blend-sweater';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500&h=500&fit=crop&q=80' WHERE slug = 'high-waisted-jeans';

-- FASHION - Shoes
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop&q=80' WHERE slug = 'nike-air-max-2024';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=500&h=500&fit=crop&q=80' WHERE slug = 'adidas-ultraboost-23';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=500&h=500&fit=crop&q=80' WHERE slug = 'chelsea-boots-brown';

-- FASHION - Accessories
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500&h=500&fit=crop&q=80' WHERE slug = 'designer-sunglasses';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1624222247344-550fb60583c3?w=500&h=500&fit=crop&q=80' WHERE slug = 'italian-leather-belt';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=500&h=500&fit=crop&q=80' WHERE slug = 'luxury-automatic-watch';

-- HOME & GARDEN - Furniture
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500&h=500&fit=crop&q=80' WHERE slug = 'modern-velvet-sofa';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1617806118233-18e1de247200?w=500&h=500&fit=crop&q=80' WHERE slug = 'scandinavian-dining-table';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=500&h=500&fit=crop&q=80' WHERE slug = 'ergonomic-office-chair';

-- HOME & GARDEN - Bedroom
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=500&h=500&fit=crop&q=80' WHERE slug = 'memory-foam-mattress-queen';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=500&h=500&fit=crop&q=80' WHERE slug = 'egyptian-cotton-sheets';

-- HOME & GARDEN - Kitchen
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1570222094114-d054a817e56b?w=500&h=500&fit=crop&q=80' WHERE slug = 'kitchenaid-stand-mixer';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1584990347449-39b34d837e61?w=500&h=500&fit=crop&q=80' WHERE slug = 'stainless-steel-cookware-set';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1585515320310-259814833e62?w=500&h=500&fit=crop&q=80' WHERE slug = 'ninja-air-fryer-max-xl';

-- HOME & GARDEN - Decor
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1600166898405-da9535204843?w=500&h=500&fit=crop&q=80' WHERE slug = 'handwoven-area-rug';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15?w=500&h=500&fit=crop&q=80' WHERE slug = 'modern-floor-lamp';

-- HOME & GARDEN - Garden
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?w=500&h=500&fit=crop&q=80' WHERE slug = 'outdoor-patio-set';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?w=500&h=500&fit=crop&q=80' WHERE slug = 'smart-garden-system';

-- SPORTS & OUTDOORS - Fitness
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=500&h=500&fit=crop&q=80' WHERE slug = 'adjustable-dumbbell-set';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500&h=500&fit=crop&q=80' WHERE slug = 'professional-yoga-mat';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1598289431512-b97b0917affc?w=500&h=500&fit=crop&q=80' WHERE slug = 'resistance-bands-set';

-- SPORTS & OUTDOORS - Cycling
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?w=500&h=500&fit=crop&q=80' WHERE slug = 'mountain-bike-carbon';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=500&h=500&fit=crop&q=80' WHERE slug = 'road-bike-aluminum';

-- SPORTS & OUTDOORS - Camping
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1478131143081-80f7f84ca84d?w=500&h=500&fit=crop&q=80' WHERE slug = '4-season-camping-tent';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1622260614153-03223fb72052?w=500&h=500&fit=crop&q=80' WHERE slug = 'hiking-backpack-65l';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1541672107676-d4e79a9e9100?w=500&h=500&fit=crop&q=80' WHERE slug = 'sleeping-bag-winter';

-- SPORTS & OUTDOORS - Water Sports
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1505142468610-359e7d316be0?w=500&h=500&fit=crop&q=80' WHERE slug = 'inflatable-paddleboard';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=500&h=500&fit=crop&q=80' WHERE slug = 'kayak-single';

-- SPORTS & OUTDOORS - Running
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1523395243481-163f8f6155ab?w=500&h=500&fit=crop&q=80' WHERE slug = 'gps-running-watch';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556906918-4b6d09e18151?w=500&h=500&fit=crop&q=80' WHERE slug = 'running-hydration-vest';

-- BOOKS & MEDIA - Fiction
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=500&h=500&fit=crop&q=80' WHERE slug = 'midnight-library';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500&h=500&fit=crop&q=80' WHERE slug = 'project-hail-mary';

-- BOOKS & MEDIA - Non-Fiction
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?w=500&h=500&fit=crop&q=80' WHERE slug = 'atomic-habits';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=500&h=500&fit=crop&q=80' WHERE slug = 'sapiens-brief-history';

-- BOOKS & MEDIA - Technology
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=500&h=500&fit=crop&q=80' WHERE slug = 'clean-code';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=500&h=500&fit=crop&q=80' WHERE slug = 'pragmatic-programmer';

-- BOOKS & MEDIA - Self-Help
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500&h=500&fit=crop&q=80' WHERE slug = 'power-of-now';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=500&h=500&fit=crop&q=80' WHERE slug = 'cant-hurt-me';

-- BOOKS & MEDIA - Comics & Graphic Novels
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=500&h=500&fit=crop&q=80' WHERE slug = 'sandman-vol-1';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?w=500&h=500&fit=crop&q=80' WHERE slug = 'watchmen';

-- BOOKS & MEDIA - Educational
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?w=500&h=500&fit=crop&q=80' WHERE slug = 'learning-python';
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1533279443086-d1c19a186416?w=500&h=500&fit=crop&q=80' WHERE slug = 'design-patterns';

-- Verify updates
SELECT
  name,
  slug,
  CASE
    WHEN image_url LIKE '%q=80%' THEN '✅ Updated'
    ELSE '⚠️ Needs update'
  END as status
FROM products
ORDER BY category_id, name;
