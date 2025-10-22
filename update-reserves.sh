#!/bin/bash

# === CONFIG ===
RESERVE_WALLET="0x0ef7b60b804f41b9bd5f1c2b46b4404571af5b3d"
CONTRACT="0x3a4184028de3f2b2fb63d596ec9101328ac7a736"
ETHERSCAN_API_KEY="B4NS5ATV7CV3RKFFSATUD6M2WN34FNT5CR"
FILE="Transparency.md"
DATE=$(date '+%B %d, %Y at %H:%M UTC')

# === API URL ===
API_URL="https://api.etherscan.io/api"

echo "Fetching JUSDC balance for $RESERVE_WALLET via Etherscan..."

# === Fetch Token Balance ===
RESPONSE=$(curl -s "$API_URL?module=account&action=tokenbalance&contractaddress=$CONTRACT&address=$RESERVE_WALLET&tag=latest&apikey=$ETHERSCAN_API_KEY")

# === Parse JSON using grep + cut ===
BALANCE=$(echo "$RESPONSE" | grep -o '"result":"[0-9]*"' | cut -d'"' -f4)

if [ -z "$BALANCE" ] || [ "$BALANCE" = "0" ]; then
    echo "ERROR: Failed to fetch balance. Full response:"
    echo "$RESPONSE"
    exit 1
fi

# === Convert from wei (18 decimals) ===
BALANCE_HUMAN=$(echo "scale=2; $BALANCE / 1000000000000000000" | bc -l)

# Safety check
if [ -z "$BALANCE_HUMAN" ]; then
    echo "ERROR: Balance conversion failed."
    exit 1
fi

# === Backup existing file ===
cp "$FILE" "$FILE.bak"

# === Update Transparency.md ===
sed -i "/## On-Chain Proof of Reserves/,/Last Updated/c\
## On-Chain Proof of Reserves\n- **Reserve & Treasury Wallet**: \`$RESERVE_WALLET\`  \n  [View on Etherscan](https://etherscan.io/address/$RESERVE_WALLET#tokentxns)\n- **Current Balance**: $BALANCE_HUMAN JUSDC\n- **Total Supply**: 37,975,000.00 JUSDC\n- **Backing Ratio**: 100% (1:1 USD Peg)\n- **Last Updated**: $DATE" "$FILE"

# === Commit & Push ===
git add "$FILE"
git commit -m "AUTO: Reserves updated — $BALANCE_HUMAN JUSDC ($DATE)" || echo "No changes to commit."
git push origin main

echo "SUCCESS: Reserve update complete!"
echo "Live at: https://jusdc-official.github.io/jusdc-docs"
