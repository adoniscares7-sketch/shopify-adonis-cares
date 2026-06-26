#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./scripts/push-product.sh <slug>"
  echo "Example: ./scripts/push-product.sh walking-on-eggshells"
  exit 1
fi

SLUG="$1"
COVER="covers/${SLUG}.jpg"
PDF="pdfs/${SLUG}.pdf"

if [ ! -f "$COVER" ] || [ ! -f "$PDF" ]; then
  echo "Error: $COVER or $PDF not found. Create them first."
  exit 1
fi

echo "Adding product files for $SLUG..."
git add "$COVER" "$PDF"

echo "Committing..."
git commit -m "Add product: $SLUG

- New cover: $COVER
- New PDF: $PDF
- Auto-pushed via push-product.sh"

echo "Pushing to origin/main..."
git push origin main

echo "✅ Successfully pushed $SLUG to https://github.com/adoniscares7-sketch/shopify-adonis-cares"
echo "Repo folder: root (pdfs/ and covers/)"
