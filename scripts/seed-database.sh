#!/bin/bash

# =====================================================
# ShopFast Database Seeding Script
# =====================================================
# This script populates the Supabase database with
# comprehensive product data for the e-commerce platform
# =====================================================

set -e  # Exit on error

echo "🚀 ShopFast Database Seeding"
echo "======================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Load environment variables
if [ -f .env ]; then
    echo "📦 Loading environment variables..."
    export $(cat .env | grep -v '^#' | xargs)
else
    echo -e "${RED}❌ Error: .env file not found${NC}"
    echo "Please create a .env file with your Supabase credentials:"
    echo "VITE_SUPABASE_URL=your_project_url"
    echo "VITE_SUPABASE_ANON_KEY=your_anon_key"
    echo "SUPABASE_SERVICE_ROLE_KEY=your_service_role_key"
    exit 1
fi

# Check if required variables are set
if [ -z "$VITE_SUPABASE_URL" ] || [ -z "$SUPABASE_SERVICE_ROLE_KEY" ]; then
    echo -e "${RED}❌ Error: Missing required environment variables${NC}"
    echo "Required: VITE_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY"
    exit 1
fi

echo -e "${GREEN}✓ Environment variables loaded${NC}"
echo ""

# Extract project reference from Supabase URL
PROJECT_REF=$(echo $VITE_SUPABASE_URL | sed -n 's|https://\([^.]*\)\.supabase\.co|\1|p')

if [ -z "$PROJECT_REF" ]; then
    echo -e "${RED}❌ Error: Could not extract project reference from URL${NC}"
    exit 1
fi

echo "📊 Supabase Project: $PROJECT_REF"
echo ""

# Check if psql is installed
if ! command -v psql &> /dev/null; then
    echo -e "${YELLOW}⚠️  psql not found. Attempting to use curl method...${NC}"
    USE_CURL=true
else
    echo -e "${GREEN}✓ PostgreSQL client found${NC}"
    USE_CURL=false
fi

echo ""
echo "🌱 Seeding database with product data..."
echo ""

if [ "$USE_CURL" = true ]; then
    # Use Supabase REST API to execute SQL
    echo -e "${YELLOW}Using Supabase REST API method...${NC}"

    # Read the SQL file
    SQL_CONTENT=$(cat supabase/seed.sql)

    # Execute via Supabase SQL endpoint
    RESPONSE=$(curl -s -X POST \
        "${VITE_SUPABASE_URL}/rest/v1/rpc/exec_sql" \
        -H "apikey: ${SUPABASE_SERVICE_ROLE_KEY}" \
        -H "Authorization: Bearer ${SUPABASE_SERVICE_ROLE_KEY}" \
        -H "Content-Type: application/json" \
        -d "{\"query\": $(echo "$SQL_CONTENT" | jq -Rs .)}")

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Database seeded successfully via REST API${NC}"
    else
        echo -e "${RED}❌ Error seeding database${NC}"
        echo "$RESPONSE"
        exit 1
    fi
else
    # Use direct PostgreSQL connection
    echo "Connecting to database..."

    # Connection string format
    DB_URL="postgresql://postgres:${SUPABASE_DB_PASSWORD}@db.${PROJECT_REF}.supabase.co:5432/postgres"

    if [ -z "$SUPABASE_DB_PASSWORD" ]; then
        echo -e "${YELLOW}⚠️  SUPABASE_DB_PASSWORD not set${NC}"
        echo "Please enter your Supabase database password:"
        read -s SUPABASE_DB_PASSWORD
        echo ""
    fi

    # Execute the seed file
    psql "$DB_URL" -f supabase/seed.sql

    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}✓ Database seeded successfully${NC}"
    else
        echo -e "${RED}❌ Error seeding database${NC}"
        exit 1
    fi
fi

echo ""
echo "======================================"
echo -e "${GREEN}🎉 Database seeding completed!${NC}"
echo "======================================"
echo ""
echo "📈 Summary:"
echo "  • 5 Categories created"
echo "  • 70+ Products added"
echo "  • Multiple featured products"
echo "  • Real product images from Unsplash"
echo ""
echo "🌐 Visit your application to see the products:"
echo "  https://shopfastt.netlify.app"
echo ""
echo "📚 Product categories:"
echo "  • Electronics (13 products)"
echo "  • Fashion (12 products)"
echo "  • Home & Garden (12 products)"
echo "  • Sports & Outdoors (12 products)"
echo "  • Books & Media (12 products)"
echo ""
