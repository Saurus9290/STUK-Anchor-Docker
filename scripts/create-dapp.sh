#!/bin/bash
# Script to create a Solana dApp project using npx create-solana-dapp

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: ./scripts/create-dapp.sh <project_name>"
  exit 1
fi

echo "Creating Solana dApp project: $PROJECT_NAME"

# Run the create-solana-dapp command
npx create-solana-dapp $PROJECT_NAME

if [ $? -eq 0 ]; then
  echo "Project $PROJECT_NAME created successfully!"
  echo "To start the development server, run:"
  echo "cd $PROJECT_NAME && yarn dev"
else
  echo "Failed to create project. Check the output above for details."
fi
