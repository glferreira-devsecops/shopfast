# 🚀 Netlify Setup Guide for ShopFast

## Current Status

Your site is deployed at: **https://shopfastt.netlify.app/**

## ⚠️ IMPORTANT: Environment Variables Required

The site needs Supabase credentials to function. Follow these steps:

### 1. Add Environment Variables to Netlify

1. Go to your Netlify dashboard: https://app.netlify.com/
2. Select your site: **shopfastt**
3. Go to **Site settings** → **Environment variables**
4. Add these variables:

```
VITE_SUPABASE_URL=https://rqxnabdasqfqpfgmnsem.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeG5hYmRhc3FmcXBmZ21uc2VtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyODE0NzYsImV4cCI6MjA3NDg1NzQ3Nn0.e0BurRX5Cb1ic80NCsNJxtQz6sttMLuJ-Adnhdj6fB4
```

### 2. Trigger a New Deploy

After adding the variables:

**Option A: Via Netlify Dashboard**
- Go to **Deploys** tab
- Click **Trigger deploy** → **Clear cache and deploy site**

**Option B: Via Git Push**
```bash
git add .
git commit -m "chore: Add Netlify configuration"
git push
```

**Option C: Via Netlify CLI**
```bash
npm install -g netlify-cli
netlify login
netlify deploy --prod
```

### 3. Verify Deployment

After deployment completes:
1. Visit: https://shopfastt.netlify.app/
2. Open browser console (F12)
3. Check for errors
4. Try to sign in/browse products

## 🔧 Manual Deploy (Alternative)

If automatic deploys aren't working:

```bash
# Build locally with env vars
npm run build

# Deploy via CLI
netlify deploy --prod --dir=dist
```

## 📋 Checklist

- [ ] Environment variables added to Netlify
- [ ] New deploy triggered
- [ ] Site loads without errors
- [ ] Can browse products
- [ ] Can sign in/sign up
- [ ] Shopping cart works
- [ ] Checkout process functional

## 🆘 Troubleshooting

### Site shows blank page
- Check browser console for errors
- Verify environment variables are set in Netlify
- Ensure you triggered a new deploy after adding variables

### Supabase connection errors
- Verify the Supabase URL is correct
- Verify the anon key is correct
- Check Supabase project is active and not paused

### Build fails
- Check Netlify build logs
- Verify Node.js version is 18+
- Check all dependencies are installed

## 📊 Current Configuration

- **Site URL**: https://shopfastt.netlify.app/
- **Framework**: Vite + React + TypeScript
- **Node Version**: 18
- **Build Command**: `npm run build`
- **Publish Directory**: `dist`
- **Supabase Project**: rqxnabdasqfqpfgmnsem

## 🔄 Next Steps

1. Add environment variables (see above)
2. Trigger new deploy
3. Test all functionality
4. Optional: Set up custom domain
5. Optional: Configure Netlify Forms for contact

---

**Last Updated**: September 30, 2025
