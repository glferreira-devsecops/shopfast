# 🗄️ ShopFast Database Setup Guide

Complete guide to populate the ShopFast e-commerce database with realistic product data.

---

## 📋 Prerequisites

Before running the seed scripts, ensure you have:

1. **Supabase Project** - Active Supabase project with the schema already applied
2. **Environment Variables** - Properly configured `.env` file
3. **Node.js 18+** - For running the Node.js seeding script

---

## 🔑 Environment Variables Setup

Create or update your `.env` file with the following variables:

```bash
# Supabase Configuration
VITE_SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_key_here

# Required for database seeding (admin operations)
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key_here
```

### Where to find these keys:

1. Go to your Supabase project dashboard
2. Navigate to **Settings** → **API**
3. Copy the following:
   - **Project URL** → `VITE_SUPABASE_URL`
   - **anon public key** → `VITE_SUPABASE_ANON_KEY`
   - **service_role secret key** → `SUPABASE_SERVICE_ROLE_KEY` ⚠️ **Keep this secret!**

---

## 🚀 Method 1: Node.js Script (Recommended)

The easiest and most reliable method using the Supabase JavaScript client.

### Step 1: Install dependencies

```bash
npm install
```

### Step 2: Run the seeding script

```bash
npm run db:seed
```

### Expected Output:

```
🚀 ShopFast Database Seeding
======================================

📦 Step 1: Clearing existing data...
✓ Existing data cleared

📊 Step 2: Inserting categories...
✓ Inserted 5 categories

🛍️  Step 3: Inserting products...
✓ Inserted 30 products

======================================
🎉 Database seeding completed!
======================================

📈 Summary:
  • 5 Categories created
  • 30 Products added
  • 13 Featured products
  • Real product images from Unsplash
```

---

## 🐘 Method 2: Direct SQL (Advanced)

If you prefer running SQL directly or the Node.js method doesn't work.

### Option A: Using Supabase Dashboard

1. Go to your Supabase project dashboard
2. Navigate to **SQL Editor**
3. Create a new query
4. Copy the contents of `supabase/seed.sql`
5. Paste and click **Run**

### Option B: Using psql CLI

If you have PostgreSQL client installed:

```bash
# Set your database password
export SUPABASE_DB_PASSWORD=your_database_password

# Run the seed script
npm run db:seed:bash
```

---

## 📊 Database Schema

The seeding process populates:

### Categories (5 total)
- 🔌 **Electronics** - Smartphones, laptops, audio equipment
- 👔 **Fashion** - Clothing, shoes, accessories
- 🏡 **Home & Garden** - Furniture, kitchen, decor
- ⚽ **Sports & Outdoors** - Fitness, camping, cycling
- 📚 **Books & Media** - Fiction, non-fiction, educational

### Products (30+ items)

Each product includes:
- ✅ Realistic product names and descriptions
- 💰 Market-appropriate pricing
- 📦 Stock quantities
- 🖼️ High-quality product images (Unsplash)
- ⭐ Featured product flags
- 🔗 SEO-friendly slugs

---

## 🔍 Verification

After seeding, verify the data was inserted correctly:

### Using Supabase Dashboard:

1. Go to **Table Editor**
2. Check the `categories` table (should have 5 rows)
3. Check the `products` table (should have 30+ rows)
4. Verify featured products are marked correctly

### Using SQL Query:

```sql
-- Check counts
SELECT
  'Categories' as table_name,
  COUNT(*) as count
FROM categories
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
```

---

## 🌐 View Results

After successful seeding:

1. **Local Development**: Visit `http://localhost:5173`
2. **Production**: Visit `https://shopfastt.netlify.app`

You should see:
- ✅ 5 category filters in the sidebar
- ✅ 30+ products displayed in the main grid
- ✅ Featured products highlighted
- ✅ Working search and filtering
- ✅ Product images loading from Unsplash

---

## 🛠️ Troubleshooting

### Issue: "Invalid API key"

**Solution**: Make sure your `SUPABASE_SERVICE_ROLE_KEY` is set correctly in `.env`

```bash
# Check if the variable is loaded
echo $SUPABASE_SERVICE_ROLE_KEY
```

### Issue: "Permission denied"

**Solution**: Ensure Row Level Security (RLS) policies are properly configured:

```sql
-- Check if RLS is enabled
SELECT tablename, rowsecurity
FROM pg_tables
WHERE schemaname = 'public';

-- Verify policies exist
SELECT * FROM pg_policies WHERE tablename IN ('categories', 'products');
```

### Issue: "Foreign key constraint violation"

**Solution**: Make sure categories are inserted before products. The script handles this automatically, but if running SQL manually, maintain the correct order.

### Issue: Products not visible in the app

**Solution**: Check RLS policies - public read access should be enabled:

```sql
-- Categories should be publicly readable
CREATE POLICY "Categories are viewable by everyone"
  ON categories FOR SELECT
  TO public
  USING (true);

-- Products should be publicly readable
CREATE POLICY "Products are viewable by everyone"
  ON products FOR SELECT
  TO public
  USING (true);
```

---

## 🔄 Re-seeding

To clear and re-populate the database:

```bash
# This will clear existing data and insert fresh data
npm run db:seed
```

**⚠️ Warning**: This will delete all existing:
- Products
- Categories
- Cart items
- Orders
- Order items

---

## 🎨 Customization

### Adding More Products

Edit `scripts/seed-database.js` and add products to the `products` array:

```javascript
{
  category_id: '11111111-1111-1111-1111-111111111111', // Electronics
  name: 'New Product Name',
  slug: 'new-product-slug',
  description: 'Product description here',
  price: 99.99,
  stock: 50,
  image_url: 'https://images.unsplash.com/photo-xxx',
  featured: false
}
```

### Adding New Categories

Add to the `categories` array:

```javascript
{
  id: '66666666-6666-6666-6666-666666666666',
  name: 'New Category',
  slug: 'new-category',
  description: 'Category description'
}
```

### Custom Product Images

Replace Unsplash URLs with your own image URLs. Recommended:
- **Size**: 500x500px minimum
- **Format**: JPEG or PNG
- **Hosting**: Unsplash, Cloudinary, or your own CDN

---

## 📚 Product Data Structure

Each product follows this schema:

```typescript
interface Product {
  id: string;              // Auto-generated UUID
  category_id: string;     // Foreign key to categories
  name: string;            // Product name
  slug: string;            // URL-friendly identifier
  description: string;     // Product description
  price: number;           // Decimal(10,2)
  stock: number;           // Integer, must be >= 0
  image_url: string;       // Product image URL
  featured: boolean;       // Featured flag
  created_at: timestamp;   // Auto-generated
  updated_at: timestamp;   // Auto-updated
}
```

---

## 🔒 Security Notes

### Service Role Key

- ⚠️ **NEVER** commit `SUPABASE_SERVICE_ROLE_KEY` to version control
- 🔐 This key has **admin access** to your database
- 📝 Add `.env` to `.gitignore` (already done)
- 🏢 Only use in server-side or local development contexts

### Public Keys (Safe to Expose)

- ✅ `VITE_SUPABASE_URL` - Safe to commit and expose
- ✅ `VITE_SUPABASE_ANON_KEY` - Safe to commit and expose
- 🛡️ Protected by Row Level Security (RLS) policies

---

## ✅ Success Checklist

After seeding, confirm:

- [ ] 5 categories visible in the app
- [ ] 30+ products displayed
- [ ] Product images loading correctly
- [ ] Category filtering works
- [ ] Search functionality works
- [ ] Featured products displayed on homepage
- [ ] Product prices formatted correctly
- [ ] Stock quantities visible
- [ ] No console errors in browser

---

## 🆘 Need Help?

If you encounter issues:

1. **Check Logs**: Look for error messages in the console output
2. **Verify Environment**: Ensure all environment variables are set
3. **Check Supabase Dashboard**: Verify tables exist and have correct structure
4. **Review Policies**: Ensure RLS policies allow public read access
5. **Test Connection**: Try running a simple query in Supabase SQL Editor

---

## 🎉 Next Steps

After successful seeding:

1. ✅ Test the application thoroughly
2. 📱 Check responsive design on mobile
3. 🔐 Test user authentication and cart functionality
4. 📦 Create test orders
5. 🚀 Deploy to production

---

**Happy selling with ShopFast! 🛍️**
