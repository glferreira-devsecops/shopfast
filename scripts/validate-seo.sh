#!/bin/bash
#
# SEO Implementation Validation Script
# Validates all SEO components are properly configured
#

echo "=========================================="
echo "ShopFast SEO Implementation Validation"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track validation status
ERRORS=0
WARNINGS=0
SUCCESS=0

# Function to check if file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} Found: $1"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}✗${NC} Missing: $1"
        ERRORS=$((ERRORS + 1))
    fi
}

# Function to check if string exists in file
check_content() {
    if grep -q "$2" "$1" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} $3"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}✗${NC} $3"
        ERRORS=$((ERRORS + 1))
    fi
}

# Function to check if string exists in file (warning)
check_content_warning() {
    if grep -q "$2" "$1" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} $3"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${YELLOW}⚠${NC} $3"
        WARNINGS=$((WARNINGS + 1))
    fi
}

echo "1. Checking Essential SEO Files"
echo "-----------------------------------"
check_file "index.html"
check_file "public/robots.txt"
check_file "public/sitemap.xml"
check_file "public/manifest.json"
check_file "netlify.toml"
echo ""

echo "2. Checking index.html Meta Tags"
echo "-----------------------------------"
check_content "index.html" "<title>" "Title tag present"
check_content "index.html" "meta name=\"description\"" "Meta description present"
check_content "index.html" "meta name=\"keywords\"" "Meta keywords present"
check_content "index.html" "rel=\"canonical\"" "Canonical URL present"
check_content "index.html" "meta name=\"robots\"" "Robots meta tag present"
echo ""

echo "3. Checking Open Graph Tags"
echo "-----------------------------------"
check_content "index.html" "property=\"og:type\"" "og:type present"
check_content "index.html" "property=\"og:title\"" "og:title present"
check_content "index.html" "property=\"og:description\"" "og:description present"
check_content "index.html" "property=\"og:image\"" "og:image present"
check_content "index.html" "property=\"og:url\"" "og:url present"
echo ""

echo "4. Checking Twitter Card Tags"
echo "-----------------------------------"
check_content "index.html" "name=\"twitter:card\"" "Twitter card present"
check_content "index.html" "name=\"twitter:title\"" "Twitter title present"
check_content "index.html" "name=\"twitter:description\"" "Twitter description present"
check_content "index.html" "name=\"twitter:image\"" "Twitter image present"
echo ""

echo "5. Checking Structured Data (JSON-LD)"
echo "-----------------------------------"
check_content "index.html" "\"@type\": \"WebSite\"" "WebSite schema present"
check_content "index.html" "\"@type\": \"Organization\"" "Organization schema present"
check_content "index.html" "\"@type\": \"Store\"" "Store schema present"
check_content "index.html" "\"@type\": \"BreadcrumbList\"" "BreadcrumbList schema present"
echo ""

echo "6. Checking robots.txt Configuration"
echo "-----------------------------------"
check_content "public/robots.txt" "User-agent: \*" "User-agent wildcard present"
check_content "public/robots.txt" "Allow: /" "Allow directive present"
check_content "public/robots.txt" "Sitemap:" "Sitemap reference present"
check_content "public/robots.txt" "Disallow: /admin/" "Admin blocking present"
echo ""

echo "7. Checking sitemap.xml Structure"
echo "-----------------------------------"
check_content "public/sitemap.xml" "<?xml version" "XML declaration present"
check_content "public/sitemap.xml" "<urlset" "URLset tag present"
check_content "public/sitemap.xml" "<loc>" "Location tags present"
check_content "public/sitemap.xml" "<changefreq>" "Change frequency present"
check_content "public/sitemap.xml" "<priority>" "Priority tags present"
echo ""

echo "8. Checking manifest.json Configuration"
echo "-----------------------------------"
check_content "public/manifest.json" "\"name\":" "App name present"
check_content "public/manifest.json" "\"short_name\":" "Short name present"
check_content "public/manifest.json" "\"icons\":" "Icons array present"
check_content "public/manifest.json" "\"theme_color\":" "Theme color present"
check_content "public/manifest.json" "\"display\": \"standalone\"" "Standalone display mode"
echo ""

echo "9. Checking Mobile Optimization"
echo "-----------------------------------"
check_content "index.html" "name=\"viewport\"" "Viewport meta tag present"
check_content "index.html" "apple-mobile-web-app" "Apple mobile web app tags"
check_content "index.html" "name=\"theme-color\"" "Theme color meta tag"
echo ""

echo "10. Checking Performance Headers"
echo "-----------------------------------"
check_content "netlify.toml" "Cache-Control" "Cache control headers present"
check_content "netlify.toml" "X-Frame-Options" "Security headers present"
check_content_warning "netlify.toml" "Content-Security-Policy" "Content Security Policy (optional)"
echo ""

echo "11. Optional Files (Warnings if Missing)"
echo "-----------------------------------"
check_content_warning "public" "og-image.jpg" "Open Graph image (create 1200x630px)"
check_content_warning "public" "twitter-card.jpg" "Twitter card image (create 1200x675px)"
check_content_warning "public" "logo.png" "Logo file for schema markup"
check_content_warning "public" "favicon.svg" "Favicon SVG"
echo ""

echo "=========================================="
echo "Validation Summary"
echo "=========================================="
echo -e "${GREEN}✓ Success: $SUCCESS${NC}"
echo -e "${YELLOW}⚠ Warnings: $WARNINGS${NC}"
echo -e "${RED}✗ Errors: $ERRORS${NC}"
echo ""

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}🎉 SEO Implementation Validation PASSED!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Create social media images (og-image.jpg, twitter-card.jpg)"
    echo "2. Submit sitemap to Google Search Console"
    echo "3. Install Google Analytics 4"
    echo "4. Add alt tags to all images"
    echo "5. Create essential pages (About, Contact, FAQ)"
    echo ""
    exit 0
else
    echo -e "${RED}❌ SEO Implementation Validation FAILED!${NC}"
    echo ""
    echo "Please fix the errors above and run validation again."
    echo ""
    exit 1
fi
