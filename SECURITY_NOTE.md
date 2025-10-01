# Security Note - esbuild Vulnerability

## Status

GitHub Dependabot detected a **moderate severity** vulnerability in esbuild (GHSA-67mh-4wv8-2f99).

## Impact Assessment

**This vulnerability ONLY affects DEVELOPMENT, NOT PRODUCTION:**

- ✅ **Production builds are NOT affected** - The built/compiled application (`dist/`) is safe
- ⚠️ **Development server only** - The vulnerability is in the dev server CORS configuration
- 🔒 **Attack requires local network access** - Attacker needs access to `localhost:8000`

## Technical Details

The vulnerability allows malicious websites to read files from the esbuild development server due to permissive CORS settings (`Access-Control-Allow-Origin: *`).

**Requirements for exploit:**
1. Developer must be running `npm run dev`
2. Developer must visit a malicious website
3. Malicious website sends requests to `http://localhost:5173` (dev server)

## Resolution

### Option 1: Wait for Dependabot (Recommended)

Dependabot is automatically creating a PR to update dependencies. This will be merged when ready.

### Option 2: Manual Update

Update to Vite 6 (when stable) which will use esbuild 0.25.0+:

```bash
npm install vite@latest
```

### Option 3: Workaround

Don't visit untrusted websites while running the development server.

## Why This is Low Risk

1. **Development only** - Not in production
2. **Local network** - Requires localhost access
3. **Social engineering** - Developer must visit malicious site
4. **No remote exploit** - Can't be exploited over the internet

## Production Safety

The deployed applications are completely safe:
- ✅ Netlify: Uses production build (`dist/`)
- ✅ GitHub Pages: Uses production build (`dist/`)
- ✅ All hosting: Never uses esbuild dev server

---

**Bottom line:** This is a development-only issue with low practical risk. Production deployments are not affected.
