#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Add the Helm GPG key
echo "Adding Helm GPG key..."
curl -fsSL https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

# Install apt-transport-https if not already installed
echo "Installing apt-transport-https..."
sudo apt-get install apt-transport-https --yes

# Add the Helm repository
echo "Adding Helm repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install Helm
echo "Installing Helm..."
sudo apt-get install helm --yes

# Verify installation
echo "Verifying Helm installation..."
helm version
