#!/bin/bash

# ==============================================================================
# OrbStack Linux 虚拟机环境一键同步脚本
# 功能：在新创建的 Orb 虚拟机中快速恢复 Zsh、插件、工具以及软链接配置
# ==============================================================================

echo "开始同步 OrbStack 虚拟机环境..."

# 1. 更新包列表并安装基础工具
echo "安装基础工具 (zsh, git, eza, zoxide, unzip, 插件)..."
sudo apt update
sudo apt install -y zsh git eza zoxide unzip zsh-syntax-highlighting zsh-autosuggestions

# 2. 安装 Yazi (从 GitHub 下载最新二进制文件)
echo "安装 Yazi..."
curl -sL https://github.com/sxyazi/yazi/releases/latest/download/yazi-aarch64-unknown-linux-gnu.zip -o yazi.zip
unzip -q yazi.zip
sudo mv yazi-aarch64-unknown-linux-gnu/yazi yazi-aarch64-unknown-linux-gnu/ya /usr/local/bin/
rm -rf yazi.zip yazi-aarch64-unknown-linux-gnu

# 3. 创建软链接 (指向 OrbStack 挂载的 Mac 共享目录)
# 假设 Mac 用户名为 penggo，OrbStack 默认挂载路径为 /mnt/mac
MAC_HOME="/mnt/mac/Users/penggo"

echo "创建配置文件软链接..."
rm -f ~/.zshrc ~/.oh-my-zsh ~/.p10k.zsh ~/.vimrc
ln -s "$MAC_HOME/.zshrc" ~/.zshrc
ln -s "$MAC_HOME/.oh-my-zsh" ~/.oh-my-zsh
ln -s "$MAC_HOME/.p10k.zsh" ~/.p10k.zsh
ln -s "$MAC_HOME/.vimrc" ~/.vimrc

# 4. 切换默认 Shell 为 Zsh
echo "切换默认 Shell 为 Zsh..."
sudo chsh -s $(which zsh) $(whoami)

echo "----------------------------------------------------"
echo "同步完成！请重新连接或输入 'zsh' 进入新环境。"
echo "注意：zoxide 需要你访问过目录后才会有跳转历史。"
echo "----------------------------------------------------"
