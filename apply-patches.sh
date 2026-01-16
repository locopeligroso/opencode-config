#!/bin/bash
# Script to apply Gemini fix patch to opencode-antigravity-auth

CACHE_PATH="/Users/dev10/.cache/opencode/node_modules/opencode-antigravity-auth/dist/src/plugin/transform/gemini.js"
PATCH_FILE="/Users/dev10/.config/opencode/patches/opencode-antigravity-auth+1.2.9-beta.8.patch"

if [ -f "$CACHE_PATH" ]; then
    echo "✅ Found opencode-antigravity-auth in cache"
    echo "📝 Applying Gemini fix patch..."
    
    cd /Users/dev10/.cache/opencode/node_modules
    patch -p0 < "$PATCH_FILE"
    
    if [ $? -eq 0 ]; then
        echo "✅ Patch applied successfully!"
    else
        echo "⚠️  Patch may already be applied or file changed"
    fi
else
    echo "❌ opencode-antigravity-auth not found in cache"
    exit 1
fi
