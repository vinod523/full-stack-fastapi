#!/bin/bash

# Test script to validate the Copier template generation
# This script creates a test project using Copier and verifies it was generated correctly

set -e

echo "🧪 Testing Full Stack FastAPI Template Generation"
echo "================================================"

# Get the template directory (parent of the scripts directory)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🎯 Template directory: $TEMPLATE_DIR"

# Create temporary directory for testing
TEST_DIR="/tmp/test-fastapi-template-$(date +%s)"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

echo "📁 Working directory: $TEST_DIR"

# Test template generation with Copier
echo "🔄 Generating test project with Copier..."

# Define test parameters
PROJECT_NAME="Test FastAPI Project"
STACK_NAME="test-fastapi-project"
SECRET_KEY="test-secret-key-12345"
FIRST_SUPERUSER="test@example.com"
FIRST_SUPERUSER_PASSWORD="testpassword123"
POSTGRES_PASSWORD="testdbpassword123"

copier copy "$TEMPLATE_DIR" test-project --trust \
    --data project_name="$PROJECT_NAME" \
    --data stack_name="$STACK_NAME" \
    --data secret_key="$SECRET_KEY" \
    --data first_superuser="$FIRST_SUPERUSER" \
    --data first_superuser_password="$FIRST_SUPERUSER_PASSWORD" \
    --data postgres_password="$POSTGRES_PASSWORD" \
    --data smtp_host="" \
    --data smtp_user="" \
    --data smtp_password="" \
    --data emails_from_email="info@example.com" \
    --data sentry_dsn=""

echo "✅ Project generated successfully!"

# Verify the project structure
echo "🔍 Verifying project structure..."

cd test-project

# Check essential files exist
required_files=(
    ".env"
    "README.md"
    "docker-compose.yml"
    "backend/app/main.py"
    "frontend/package.json"
    ".github/workflows/test.yml"
)

for file in "${required_files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "✅ $file exists"
    else
        echo "❌ $file is missing"
        exit 1
    fi
done

# Verify .env file was updated correctly
echo "🔍 Verifying .env file configuration..."

if grep -q "PROJECT_NAME='$PROJECT_NAME'" .env; then
    echo "✅ PROJECT_NAME updated correctly"
else
    echo "❌ PROJECT_NAME not updated correctly"
    exit 1
fi

if grep -q "STACK_NAME=$STACK_NAME" .env; then
    echo "✅ STACK_NAME updated correctly"
else
    echo "❌ STACK_NAME not updated correctly"
    exit 1
fi

if grep -q "SECRET_KEY=$SECRET_KEY" .env; then
    echo "✅ SECRET_KEY updated correctly"
else
    echo "❌ SECRET_KEY not updated correctly"
    exit 1
fi

if grep -q "FIRST_SUPERUSER=$FIRST_SUPERUSER" .env; then
    echo "✅ FIRST_SUPERUSER updated correctly"
else
    echo "❌ FIRST_SUPERUSER not updated correctly"
    exit 1
fi

if grep -q "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" .env; then
    echo "✅ POSTGRES_PASSWORD updated correctly"
else
    echo "❌ POSTGRES_PASSWORD not updated correctly"
    exit 1
fi

echo "🎉 Template validation completed successfully!"
echo "📁 Test project created at: $TEST_DIR/test-project"
echo ""
echo "Next steps to test the generated project:"
echo "  cd $TEST_DIR/test-project"
echo "  docker compose build"
echo "  docker compose up -d"
echo ""
echo "🧹 Clean up test directory when done:"
echo "  rm -rf $TEST_DIR"