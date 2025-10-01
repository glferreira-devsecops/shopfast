# Deployment Guide

This guide covers deploying ShopFast to various hosting platforms.

## Prerequisites

- Supabase project set up with database schema
- Environment variables ready
- Production build tested locally

## Platform-Specific Guides

### Vercel (Recommended)

Vercel provides excellent React/Vite support with zero configuration.

#### Method 1: GitHub Integration (Recommended)

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/shopfast.git
   git push -u origin main
   ```

2. **Deploy to Vercel**
   - Go to [Vercel Dashboard](https://vercel.com)
   - Click "New Project"
   - Import your GitHub repository
   - Configure:
     - Framework Preset: Vite
     - Build Command: `npm run build`
     - Output Directory: `dist`

3. **Add Environment Variables**
   - In Vercel project settings → Environment Variables:
     ```
     VITE_SUPABASE_URL=your_supabase_url
     VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
     ```

4. **Deploy**
   - Click "Deploy"
   - Vercel will automatically deploy on every push to main

#### Method 2: Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy
vercel

# Deploy to production
vercel --prod
```

### Netlify

#### Method 1: GitHub Integration

1. **Push to GitHub** (same as Vercel)

2. **Deploy to Netlify**
   - Go to [Netlify Dashboard](https://app.netlify.com)
   - Click "New site from Git"
   - Connect to GitHub and select repository
   - Configure:
     - Build command: `npm run build`
     - Publish directory: `dist`

3. **Add Environment Variables**
   - In Site settings → Environment variables:
     ```
     VITE_SUPABASE_URL=your_supabase_url
     VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
     ```

4. **Deploy**
   - Click "Deploy site"
   - Auto-deploys on every push

#### Method 2: Netlify CLI

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login

# Initialize
netlify init

# Deploy
netlify deploy

# Deploy to production
netlify deploy --prod
```

#### Netlify Configuration File

Create `netlify.toml` in project root:

```toml
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[build.environment]
  NODE_VERSION = "18"
```

### GitHub Pages

1. **Install gh-pages**
   ```bash
   npm install --save-dev gh-pages
   ```

2. **Update package.json**
   ```json
   {
     "homepage": "https://YOUR_USERNAME.github.io/shopfast",
     "scripts": {
       "predeploy": "npm run build",
       "deploy": "gh-pages -d dist"
     }
   }
   ```

3. **Update vite.config.ts**
   ```typescript
   export default defineConfig({
     base: '/shopfast/',
     // ... rest of config
   })
   ```

4. **Deploy**
   ```bash
   npm run deploy
   ```

5. **Configure GitHub Pages**
   - Go to repository Settings → Pages
   - Source: Deploy from branch
   - Branch: gh-pages

### AWS Amplify

1. **Push to GitHub**

2. **AWS Amplify Console**
   - Open [AWS Amplify Console](https://console.aws.amazon.com/amplify)
   - Click "New app" → "Host web app"
   - Connect GitHub repository
   - Configure:
     - Build settings: Auto-detected
     - Build command: `npm run build`
     - Output directory: `dist`

3. **Environment Variables**
   - In App settings → Environment variables:
     ```
     VITE_SUPABASE_URL=your_supabase_url
     VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
     ```

4. **Deploy**
   - Amplify will build and deploy automatically

### Cloudflare Pages

1. **Push to GitHub**

2. **Cloudflare Pages**
   - Go to [Cloudflare Pages](https://pages.cloudflare.com)
   - Create a new project
   - Connect GitHub repository
   - Configure:
     - Framework preset: None
     - Build command: `npm run build`
     - Build output directory: `dist`

3. **Environment Variables**
   ```
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   NODE_VERSION=18
   ```

4. **Deploy**
   - Click "Save and Deploy"

### Docker Deployment

#### Dockerfile

Create `Dockerfile`:

```dockerfile
# Build stage
FROM node:18-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

ARG VITE_SUPABASE_URL
ARG VITE_SUPABASE_ANON_KEY

ENV VITE_SUPABASE_URL=$VITE_SUPABASE_URL
ENV VITE_SUPABASE_ANON_KEY=$VITE_SUPABASE_ANON_KEY

RUN npm run build

# Production stage
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

#### nginx.conf

Create `nginx.conf`:

```nginx
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
}
```

#### Build and Run

```bash
# Build image
docker build \
  --build-arg VITE_SUPABASE_URL=your_url \
  --build-arg VITE_SUPABASE_ANON_KEY=your_key \
  -t shopfast .

# Run container
docker run -p 80:80 shopfast
```

#### Docker Compose

Create `docker-compose.yml`:

```yaml
version: '3.8'

services:
  shopfast:
    build:
      context: .
      args:
        VITE_SUPABASE_URL: ${VITE_SUPABASE_URL}
        VITE_SUPABASE_ANON_KEY: ${VITE_SUPABASE_ANON_KEY}
    ports:
      - "80:80"
    restart: unless-stopped
```

Run with:
```bash
docker-compose up -d
```

## Post-Deployment Checklist

- [ ] Environment variables configured correctly
- [ ] HTTPS enabled
- [ ] Custom domain configured (if applicable)
- [ ] Performance monitoring setup
- [ ] Error tracking configured
- [ ] Analytics integrated
- [ ] Supabase RLS policies tested in production
- [ ] All features tested in production environment

## Environment Variables

Required environment variables for all platforms:

```env
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

## Performance Optimization

### Build Optimization

1. **Enable compression**
   - Most hosting platforms enable gzip/brotli automatically
   - Verify in browser DevTools → Network

2. **Configure caching**
   - Set appropriate cache headers for static assets
   - Use CDN for optimal delivery

3. **Monitor bundle size**
   ```bash
   npm run build
   # Check dist/ folder size
   ```

### Runtime Optimization

1. **Enable Supabase caching**
2. **Use CDN for assets**
3. **Configure edge caching**
4. **Monitor Core Web Vitals**

## Continuous Deployment

### GitHub Actions

The project includes CI/CD workflows in `.github/workflows/`:

- `ci.yml` - Runs on pull requests and pushes
- `deploy.yml` - Deploys on releases

Configure secrets in GitHub repository settings:
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

Platform-specific secrets (if using automated deployment):
- Vercel: `VERCEL_TOKEN`, `VERCEL_ORG_ID`, `VERCEL_PROJECT_ID`
- Netlify: `NETLIFY_AUTH_TOKEN`, `NETLIFY_SITE_ID`

## Monitoring and Analytics

### Recommended Tools

1. **Performance Monitoring**
   - Vercel Analytics
   - Google Lighthouse CI
   - Web Vitals

2. **Error Tracking**
   - Sentry
   - Rollbar
   - LogRocket

3. **Analytics**
   - Google Analytics
   - Plausible
   - Fathom

## Troubleshooting

### Build Fails

1. Check Node.js version (must be 18+)
2. Clear npm cache: `npm cache clean --force`
3. Delete node_modules and reinstall: `rm -rf node_modules && npm install`
4. Check environment variables

### Environment Variables Not Working

1. Ensure variables start with `VITE_`
2. Rebuild after changing environment variables
3. Check hosting platform's environment variable syntax

### 404 Errors on Refresh

Configure your hosting to serve `index.html` for all routes:

**Netlify**: Add `netlify.toml` (see above)

**Vercel**: Create `vercel.json`:
```json
{
  "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }]
}
```

### CORS Issues

Supabase CORS is configured automatically. If issues persist:
1. Check Supabase project settings
2. Verify environment variables
3. Check browser console for exact error

## Security Considerations

1. **Never commit secrets**
   - Use environment variables
   - Check `.env` is in `.gitignore`

2. **Enable HTTPS**
   - All major platforms provide free SSL
   - Enforce HTTPS redirects

3. **Configure CSP**
   - Add Content Security Policy headers
   - Platform-specific configuration

4. **Monitor dependencies**
   - Run `npm audit` regularly
   - Keep dependencies updated

## Support

For deployment issues:
- Check platform documentation
- Review GitHub Actions logs
- Open an issue on GitHub

---

**Recommended Platform**: Vercel for best DX and performance
