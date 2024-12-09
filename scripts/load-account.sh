#!/bin/bash
# Load custom accounts into the Solana localnet

# Check if an account address is provided
ACCOUNT=$1
if [ -z "$ACCOUNT" ]; then
  echo "Usage: ./scripts/load-accounts.sh <account_address>"
  exit 1
fi

# Check if the keypair file exists
if [ ! -f /root/.config/solana/id.json ]; then
  echo "Keypair not found. Generating a new one..."
  mkdir -p /root/.config/solana
  solana-keygen new --outfile /root/.config/solana/id.json --no-bip39-passphrase
  solana config set --url http://127.0.0.1:8899
else
  echo "Using existing keypair."
fi

# Perform airdrop for the specified account
echo "Airdropping tokens to $ACCOUNT..."
solana airdrop 100 "$ACCOUNT" --url http://127.0.0.1:8899

# Display the default Solana address
DEFAULT_ADDRESS=$(solana address)
echo "Default Solana Address: $DEFAULT_ADDRESS"
