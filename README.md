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
