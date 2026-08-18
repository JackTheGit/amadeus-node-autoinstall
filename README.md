# 🚀 Amadeus Protocol Node 1-Click Installer & Computor Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS: Ubuntu](https://img.shields.io/badge/OS-Ubuntu%2022.04%20%7C%2024.04-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![Shell: Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Network: Amadeus](https://img.shields.io/badge/Network-Amadeus%20Protocol-00C49F)](https://docs.ama.one/)
[![Status: Active](https://img.shields.io/badge/Status-Mainnet%20Ready-brightgreen)](#)

> Automate your **Amadeus Protocol (`amadeusd`)** full node deployment and Useful Proof of Work (**uPoW matrix mining**) setup in under 60 seconds.

---

## ⚡ Features

- **1-Click Execution:** Fully automated deployment using a single shell command.
- **Kernel Buffer Tuning:** Automatically applies the official recommended `sysctl` network buffers (`rmem_max`, `wmem_max`, `netdev_max_backlog`).
- **uPoW Matrix Computor Enabled:** Preconfigured with `COMPUTOR=true` and auto CPU thread detection (`COMPUTOR_UPOW_THREADS=0`) to solve matrix multiplication challenges for $AMA rewards.
- **Service Management:** Configures a resilient `systemd` daemon running inside a persistent `screen` session for seamless background operation and auto-restarts on reboot.

---

## 💻 System Requirements

| Specification | Recommended | Minimum |
| :--- | :--- | :--- |
| **OS** | Ubuntu 22.04 / 24.04 LTS | Linux 64-bit |
| **CPU** | 4 – 8+ Cores (for uPoW computation) | 2 Cores |
| **RAM** | 8 GB+ | 4 GB |
| **Storage** | 200 GB+ NVMe/SSD | 100 GB SSD |
| **Network** | 1 Gbps port | 100 Mbps |

---

## 🚀 Quick Start (1-Click Install)

Run the following command as `root` (or with `sudo`):

```bash
curl -sSL [https://raw.githubusercontent.com/JackTheGit/amadeus-node-autoinstall/refs/heads/main/setup.sh](https://raw.githubusercontent.com/JackTheGit/amadeus-node-autoinstall/refs/heads/main/setup.sh) | sudo bash
```

## 🔑 Crucial Step: Activating Mining Rewards

Once the installer finishes, your node will automatically generate a dedicated wallet. To submit matrix solutions (`submit_sol`) and earn block rewards, **the node wallet requires a minimum balance of 3 $AMA to cover network gas fees.**

1. **Attach to your node's console:**
   ```bash
   sudo screen -r amadeusd
   ```

2. **Copy your node's public wallet address** displayed in the log lines (starts with `6y...` or similar Base58 string).

3. **Send 3 – 5 $AMA** to that address.

4. **Verify:** As soon as the transaction confirms on-chain, the `cannot compute: no key has at least 3 AMA` warning will clear, and your balance will update next to the `💰` icon.

---

## 🛠️ Management & Useful Commands

### 🖥️ Console & Live Logs
| Action | Command / Shortcut |
| :--- | :--- |
| **Attach to live node console** | `sudo screen -r amadeusd` |
| **Safely detach (keep node running)** | Press `Ctrl + A`, then press `D` |
| **Check background service status** | `sudo systemctl status amadeusd` |

> ⚠️ **Warning:** Never use `Ctrl + C` inside the screen session, as this will terminate the node process. Always use `Ctrl + A`, then `D` to safely detach.

### 🔄 Service Control
```bash
# Restart the node
sudo systemctl restart amadeusd

# Stop the node
sudo systemctl stop amadeusd

# Start the node
sudo systemctl start amadeusd
```

---

## 🔒 Security & Wallet Backup

Your node's cryptographic seed is stored in its working cache directory:
```text
/root/.cache/amadeusd/seeds
```
- **Never share the contents of the `seeds` directory with anyone.**
- Keep a secure backup of this file to retain access to your node's accumulated mining rewards.

---

## 📚 Resources & Links

- **Official Website:** [ama.one](https://ama.one)
- **Documentation:** [docs.ama.one](https://docs.ama.one)
- **GitHub Repository:** [github.com/amadeusprotocol/node](https://github.com/amadeusprotocol/node)

---

## 📄 License

This repository is distributed under the [MIT License](LICENSE).
