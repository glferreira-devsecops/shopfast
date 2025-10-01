# GitHub Configuration

## GitHub Actions - DISABLED

GitHub Actions workflows have been disabled to avoid billing issues.

### Manual Deployment Options

**Deploy to Netlify:**
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login

# Deploy
netlify deploy --prod --dir=dist
```

**Deploy to Vercel:**
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

**Build locally:**
```bash
npm run build
# Upload dist/ folder to your hosting
```

### To Re-enable GitHub Actions

When ready to use GitHub Actions again:
1. Resolve billing issues in GitHub account settings
2. Rename `.github/workflows.disabled` to `.github/workflows`
3. Workflows will automatically activate on next push
