#!/usr/bin/env bash
set -e

echo "=================================================="
echo "    🚀 Amadeus Protocol Node 1-Click Installer    "
echo "=================================================="

# Check for root / sudo
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run as root or with sudo."
  exit 1
fi

# 1. Update and install dependencies
echo "[1/5] Installing system prerequisites..."
apt-get update -y
apt-get install -y wget screen curl ufw sysctl-utils 2>/dev/null || apt-get install -y wget screen curl

# 2. Optimize Kernel Network Buffers (Recommended by Amadeus Node)
echo "[2/5] Optimizing kernel network buffers..."
tee -a /etc/sysctl.conf > /dev/null <<'EOF'
# Amadeus Node Buffer Optimizations
net.core.rmem_max = 268435456
net.core.wmem_max = 268435456
net.core.optmem_max = 524288
net.core.netdev_max_backlog = 300000
EOF
sysctl -p /etc/sysctl.conf || sysctl --system

# 3. Download the official precompiled binary
echo "[3/5] Downloading latest amadeusd release..."
mkdir -p /root
cd /root
wget -q --show-progress https://github.com/amadeusprotocol/node/releases/latest/download/amadeusd -O /root/amadeusd
chmod +x /root/amadeusd

# 4. Create systemd background service with Computor / UPOW enabled
echo "[4/5] Creating systemd service..."
tee /etc/systemd/system/amadeusd.service > /dev/null <<'EOF'
[Unit]
Description=Amadeus Protocol Node & Computor
After=network-online.target

[Service]
Type=forking
LimitNOFILE=1048576
KillMode=control-group
Restart=always
RestartSec=3
User=root
WorkingDirectory=/root/
Environment="UDP_IPV4=0.0.0.0"
Environment="COMPUTOR=true"
Environment="COMPUTOR_UPOW_THREADS=0"
ExecStart=/usr/bin/screen -UdmS amadeusd bash -c './amadeusd'

[Install]
WantedBy=default.target
EOF

# 5. Enable & start service
echo "[5/5] Starting Amadeus Node..."
systemctl daemon-reload
systemctl enable --now amadeusd.service

echo ""
echo "=================================================="
echo "  ✅ Amadeus Node successfully installed & running!"
echo "=================================================="
echo ""
echo "📌 Next Steps:"
echo "1. Attach to node console:   sudo screen -r amadeusd"
echo "2. Detach safely:            Press 'Ctrl + A', then 'D'"
echo "3. Copy your wallet address printed in the screen console."
echo "4. Fund your node with at least 3-5 \$AMA to activate uPoW matrix mining!"
echo ""
