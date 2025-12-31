
#!/usr/bin/env bash
set -e

echo "==> Updating apt and installing build tools for node-gyp..."
sudo apt-get update -y
sudo apt-get install -y build-essential python3 make gcc g++ pkg-config

echo "==> Printing tool versions..."
node -v
npm -v
python3 --version
g++ --version

echo "==> Configuring npm for node-gyp..."
# Use Python3 explicitly; set a default MSVS version is harmless in Linux (ignored),
# but keeps config consistent if you ever run in Windows containers.
npm config set python python3

echo "==> Installing global utilities..."
# Optional: install node-gyp globally so you can call it directly
npm i -g node-gyp

echo "==> Installing project dependencies..."
# If you use pnpm or yarn, replace with the relevant command
if [ -f package-lock.json ]; then
  npm ci
else
  npm i
fi

echo "==> Building (optional; uncomment if you want a first-run build)"
# npm run build || true

echo "==> Post-create completed."
