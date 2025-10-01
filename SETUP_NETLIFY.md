# Netlify Deployment Setup

## Current Status

Site: https://shopfastt.netlify.app/

## Required Configuration

The site needs environment variables to be configured in Netlify dashboard.

### Step 1: Add Environment Variables

1. Go to: https://app.netlify.com/sites/shopfastt/configuration/env
2. Click: **Add a variable**
3. Add these two variables (get values from your local `.env` file):

```
VITE_SUPABASE_URL=<your_supabase_project_url>
VITE_SUPABASE_ANON_KEY=<your_supabase_anon_key>
```

### Step 2: Trigger New Deploy

1. Go to: https://app.netlify.com/sites/shopfastt/deploys
2. Click: **Trigger deploy** → **Clear cache and deploy site**
3. Wait 1-2 minutes for build to complete

### Step 3: Test

1. Open: https://shopfastt.netlify.app/
2. Press: **Ctrl+Shift+R** (clear browser cache)
3. Site should load with products

## Troubleshooting

### Build Fails with "Secrets detected"

If build fails due to secrets scanning, ensure:
- No `.env` file is committed to git (check `.gitignore`)
- No documentation files contain actual secret values
- Environment variables are only in Netlify dashboard

### Site Loads but Shows Errors

- Verify environment variables are correctly set in Netlify
- Check browser console for specific errors
- Ensure Supabase project is active

### Products Don't Load

- Environment variables are missing or incorrect
- Supabase RLS policies may need adjustment
- Check Supabase project dashboard for issues

## Alternative: Local `.env` File

For local development, copy `.env.example` to `.env` and add your credentials.

**Never commit the `.env` file to git!**
