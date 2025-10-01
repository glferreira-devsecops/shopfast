# 🚀 Quick Start Guide - ShopFast

## ⚡ Fastest Way to GitHub

```bash
# 1. Initialize Git
git init
git add .
git commit -m "Initial commit: ShopFast E-commerce Platform v1.0.0"

# 2. Create GitHub repo at: https://github.com/new
# Name: shopfast
# Don't initialize with README

# 3. Push to GitHub
git branch -M main
git remote add origin https://github.com/glferreira-devsecops/shopfast.git
git push -u origin main
```

## 🎯 Deploy to Vercel (Recommended)

### Option 1: Vercel Dashboard
1. Go to https://vercel.com
2. Import your GitHub repo
3. Add environment variables:
   ```
   VITE_SUPABASE_URL=your_url
   VITE_SUPABASE_ANON_KEY=your_key
   ```
4. Deploy!

### Option 2: Vercel CLI
```bash
npm i -g vercel
vercel login
vercel
```

## 📦 Available Commands

```bash
# Development
npm run dev              # Start dev server
npm run build            # Production build
npm run preview          # Preview production build

# Quality Checks
npm run lint             # Check code quality
npm run typecheck        # TypeScript validation
npm run build:production # Lint + Build

# Maintenance
npm run clean            # Clean build artifacts
npm audit                # Check security
npx update-browserslist-db@latest  # Update browser list
```

## 📋 Pre-Deployment Checklist

- [ ] Copy `.env.example` to `.env`
- [ ] Add your Supabase credentials to `.env`
- [ ] Test locally: `npm run dev`
- [ ] Build test: `npm run build`
- [ ] Push to GitHub
- [ ] Deploy to hosting platform
- [ ] Add environment variables to hosting
- [ ] Test production deployment

## 🔑 Required Environment Variables

```env
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

Get these from: Supabase Dashboard → Settings → API

## 📚 Documentation

- **Full README**: [README.md](README.md)
- **Contributing**: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Deployment**: [DEPLOYMENT.md](DEPLOYMENT.md)
- **Security**: [SECURITY.md](SECURITY.md)
- **Audit Report**: [AUDIT_REPORT.md](AUDIT_REPORT.md)

## 🆘 Troubleshooting

**Build fails?**
```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

**Environment variables not working?**
- Make sure they start with `VITE_`
- Restart dev server after changes
- Check `.env` is not committed

**404 on page refresh?**
- Hosting platform needs to redirect all routes to index.html
- See [DEPLOYMENT.md](DEPLOYMENT.md) for platform-specific configs

## 🎉 You're Ready!

Project is 100% prepared for GitHub and deployment.

**Next Steps:**
1. Push to GitHub (see commands above)
2. Deploy to Vercel
3. Share your awesome e-commerce platform! 🚀

---

**Need help?** Check [AUDIT_REPORT.md](AUDIT_REPORT.md) for complete details.
