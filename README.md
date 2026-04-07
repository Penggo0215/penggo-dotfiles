# ⚙️ penggo-dotfiles

> 个人开发环境配置仓库（工程化管理 / 一键初始化 / 可复用）

![GitHub repo size](https://img.shields.io/github/repo-size/yourname/penggo-dotfiles)
![GitHub last commit](https://img.shields.io/github/last-commit/yourname/penggo-dotfiles)
![GitHub stars](https://img.shields.io/github/stars/yourname/penggo-dotfiles?style=social)
![License](https://img.shields.io/github/license/yourname/penggo-dotfiles)

---

## ✨ 项目特性

- 🔧 模块化配置（zsh / nvim / ghostty）
- ⚡ 一键安装（bootstrap 初始化）
- 🔗 基于软链接管理（安全 & 可控）
- 🧠 支持本地私有配置（避免敏感信息泄露）
- 🖥 多设备快速同步环境
- 📦 可扩展、可维护的工程结构

---

## 📁 目录结构
dotfiles/
├── zsh/
├── nvim/
├── ghostty/
├── scripts/
│   ├── install.sh
│   ├── link.sh
│   └── utils.sh
├── Brewfile
├── .gitignore
└── README.md

---

---

## 🧪 后续规划

```markdown
- [ ] 支持 macOS / Linux 自动适配
- [ ] 自动安装 Neovim 插件
- [ ] zsh 插件自动管理（zinit / antigen）
- [ ] CI 检查配置有效性
- [ ] 一键恢复完整开发环境
