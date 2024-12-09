#!/bin/bash
# Switch Anchor CLI version

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./scripts/anchor-version.sh <version>"
  exit 1
fi

echo "Switching Anchor to version $VERSION..."
cargo install --git https://github.com/coral-xyz/anchor --tag $VERSION anchor-cli --locked
