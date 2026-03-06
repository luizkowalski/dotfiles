#!/usr/bin/env bash

set -euo pipefail

echo "🔨 Building Charm Bulb Controller..."

cd "$(dirname "$0")" || exit 1

echo "📦 Fetching dependencies..."
go mod tidy

echo "🛠️  Compiling..."
go build -o bulb bulb.go

if [ -f "bulb" ]; then
  echo "✅ Build successful! Run with ./bulb"

  chmod +x bulb

  cp bulb ~/bin/bulb

  echo "💡 Your beautiful bulb controller awaits you!"
else
  echo "❌ Build failed"
  exit 1
fi
