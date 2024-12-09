#!/bin/bash

# Load mining configuration
source ~/verus-miner/config.txt

# Start the miner
echo "Starting VerusCoin miner..."
cd ~/verus-miner
./verus-miner -o stratum+tcp://$POOL:$PORT -u $WALLET -t $THREADS

# Log stats
HASHRATE=$(./verus-miner --stats | grep 'hashrate' | awk '{print $2}')
echo "$(date): Hashrate: $HASHRATE" >> ~/verus-miner/mining_stats.txt

# Sync stats to GitHub
echo "Syncing mining stats to GitHub..."
git add mining_stats.txt config.txt
git commit -m "Updated mining stats on $(date)"
git push origin main
