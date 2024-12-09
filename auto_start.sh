#!/bin/bash

# Add the miner to the startup script
echo "Configuring auto-start for Termux..."
echo "~/verus-miner/start_mining.sh" >> ~/.bashrc
echo "Auto-start configuration complete. The miner will start when Termux is launched."
