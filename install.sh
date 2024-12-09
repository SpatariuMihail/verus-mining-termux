#!/bin/bash

# Update Termux and install required packages
echo "Updating Termux and installing necessary dependencies..."
pkg update -y
pkg upgrade -y
pkg install -y git wget curl python3 cmake clang build-essential libssl-dev libhwloc-dev

# Clone VerusCoin mining repository
echo "Cloning the VerusCoin miner repository..."
git clone https://github.com/VerusCoin/VerusCoin.git ~/verus-miner
cd ~/verus-miner

chmod +x install.sh start_mining.sh auto_start.sh


# Build the miner
echo "Building the Verus miner..."
make

# Create mining configuration file
echo "Creating mining configuration file..."
cat > ~/verus-miner/config.txt <<EOL
POOL=na.luckpool.net
PORT=3956
WALLET=your_wallet_address_here  # Replace with your Verus wallet address
THREADS=4  # Adjust based on your CPU
EOL

echo "Installation complete. To start mining, run ./start_mining.sh"
