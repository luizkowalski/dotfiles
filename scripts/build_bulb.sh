#!/usr/bin/env bash

# Build script for the Charm Bulb Controller

echo "🔨 Building Charm Bulb Controller..."

# Navigate to the script directory
cd "$(dirname "$0")"

# Make sure Go modules are up to date
echo "📦 Fetching dependencies..."
go mod tidy

# Build the Go application
echo "🛠️  Compiling..."
go build -o bulb bulb.go

# Check if build was successful
if [ -f "bulb" ]; then
  echo "✅ Build successful! Run with ./bulb"

  # Make the binary executable
  chmod +x bulb

  echo "💡 Your beautiful bulb controller awaits you!"
else
  echo "❌ Build failed"
  exit 1
fi
