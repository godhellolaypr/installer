#!/bin/bash

# Clone the repository
git clone https://github.com/godhellolaypr/btlr.git

# Navigate into the cloned repository
cd btlr

# Build the project
make

# Install the project
sudo make install

# Navigate to the destination directory
sudo mkdir -p /lib/modules/$(uname -r)/kernel/drivers/btrl
cd /lib/modules/$(uname -r)/kernel/drivers/btrl

# Copy the kernel module
sudo cp /dev/lost/btlr/build/btrl.ko .

# Load the kernel module
sudo insmod btrl.ko

# Update module dependencies
sudo depmod -a

# Add the module to the list of modules to load at boot
echo "btrl" | sudo tee /etc/modules-load.d/btrl.conf > /dev/null

# Load the module
sudo modprobe btrl
