# Iceweasel Scoop Bucket

# Iceweasel Scoop 源

> ⚠️ **No hash verification** — trust the upstream publisher.  
> ⚠️ **无哈希验证** — 请信任上游发布者。

[![Weekly Version Update](https://github.com/xiaozuo1120/scoop-iceweasel/actions/workflows/update-iceweasel.yml/badge.svg)](https://github.com/xiaozuo1120/scoop-iceweasel/actions)

Install [Iceweasel](https://github.com/adonais/iceweasel) via [Scoop](https://scoop.sh) — a privacy-focused, Firefox-derived web browser with enhanced customization and portable capabilities.

通过 [Scoop](https://scoop.sh) 安装 [Iceweasel](https://github.com/adonais/iceweasel) — 一款注重隐私、源自 Firefox/Mozilla 社区代码的网页浏览器，具有增强的自定义能力和便携性。

## 🌐 What is Iceweasel?

## 🌐 什么是 Iceweasel？

Iceweasel is an independent web browser derived from Firefox/Mozilla community code. It maintains the familiar Firefox layout while offering significant improvements:

Iceweasel 是一款独立的网页浏览器，源自 Firefox/Mozilla 社区代码。它保持了熟悉的 Firefox 布局，同时提供了显著的改进：

- **Enhanced Privacy**: Disables telemetry, crash reporting, and privacy-related tracking by default  
- **增强隐私保护**：默认禁用遥测、崩溃报告和隐私相关追踪
- **Performance Optimized**: SSE3 optimizations with merged patches for better speed  
- **性能优化**：SSE3 优化和合并补丁，提供更佳速度
- **Extension Freedom**: Allows installation of unsigned extensions  
- **扩展自由**：允许安装未经签名的扩展
- **Lightweight**: Removes less-used modules for faster startup and reduced resource usage  
- **轻量级**：移除不常用模块，加快启动速度并减少资源占用
- **Portable Mode**: Full support for running from USB drives or any location without system modifications  
- **便携模式**：完全支持从 USB 驱动器或任意位置运行，无需系统修改
- **Automatic Updates**: Built-in update mechanism keeps your browser current  
- **自动更新**：内置更新机制保持浏览器最新

## 🔧 Installation

## 🔧 安装方法

```powershell
# Add this bucket
scoop bucket add iceweasel https://github.com/xiaozuo1120/scoop-iceweasel

# Install Iceweasel
scoop install iceweasel
```

```powershell
# 添加此源
scoop bucket add iceweasel https://github.com/xiaozuo1120/scoop-iceweasel

# 安装 Iceweasel
scoop install iceweasel
```

## 🔄 Auto-update System

## 🔄 自动更新系统

This bucket features **automatic weekly version checks**:
- Every Monday at 02:00 UTC, a GitHub Action scans for new Iceweasel releases
- When a new version is detected, all version references in the manifest are automatically updated
- Simply run `scoop update` followed by `scoop update iceweasel` to install the latest version

此源具备**自动每周版本检查**功能：
- 每周一 02:00 UTC，GitHub Action 会扫描新的 Iceweasel 发布版本
- 检测到新版本时，清单文件中的所有版本引用将自动更新
- 只需运行 `scoop update` 后跟 `scoop update iceweasel` 即可安装最新版本

## 📁 Persistent Data

## 📁 持久化数据

Your browser data is preserved across updates in these directories:

您的浏览器数据在以下目录中跨版本更新保持不变：

- `profile/` – Your browser profile with bookmarks, history, and settings  
- `profile/` – 包含书签、历史记录和设置的浏览器配置文件
- `distribution/` – Custom distribution preferences and policies  
- `distribution/` – 自定义分发首选项和策略
- `addition/` – Place custom files here (extensions, themes, configuration files) to be automatically copied during installation and updates  
- `addition/` – 在此处放置自定义文件（扩展、主题、配置文件），在安装和更新时会自动复制

## 🛠️ Profile Management

## 🛠️ 配置文件管理

Iceweasel creates a dedicated 'Scoop' profile during installation. To manage profiles:

Iceweasel 在安装过程中会创建专用的 'Scoop' 配置文件。要管理配置文件：

```powershell
# Launch Profile Manager to set 'Scoop' as default
Iceweasel Profile Manager

# Check current default profile in browser
# Visit: about:profiles
```

```powershell
# 启动配置文件管理器，将 'Scoop' 设置为默认
Iceweasel Profile Manager

# 在浏览器中检查当前默认配置文件
# 访问: about:profiles
```

**Profile Setup Tips**:  
**配置文件设置技巧**：
- Always select the 'Scoop' profile in the Profile Manager  
- 在配置文件管理器中始终选择 'Scoop' 配置文件
- Click "Start Iceweasel" to make it the default  
- 点击"启动 Iceweasel"将其设为默认
- If settings are lost after updates, repeat the profile setup process  
- 如果更新后设置丢失，请重复配置文件设置过程

## ⚙️ Customization

## ⚙️ 自定义设置

### Adding Custom Files
### 添加自定义文件

Create an `addition` folder in your persistent directory (`~\scoop\persist\iceweasel\addition`) and place files there:
- `autoconfig.js` – Enterprise configuration
- `policies.json` – Security and feature policies
- Extensions/themes – Will be automatically copied to the application directory

在持久化目录中创建 `addition` 文件夹（`~\scoop\persist\iceweasel\addition`）并放置文件：
- `autoconfig.js` – 企业级配置
- `policies.json` – 安全与功能策略
- 扩展/主题 – 将自动复制到应用程序目录

### Configuration Files
### 配置文件

Iceweasel supports portable configuration through `portable.ini` – see the [official documentation](https://github.com/adonais/iceweasel) for advanced setup options.

Iceweasel 通过 `portable.ini` 支持便携式配置 – 有关高级设置选项，请参阅[官方文档](https://github.com/adonais/iceweasel)。

## 🚀 Why Use Scoop for Iceweasel?

## 🚀 为什么使用 Scoop 安装 Iceweasel？

- **No Admin Rights Required**: Install and run without administrator privileges  
- **无需管理员权限**：无需管理员权限即可安装和运行
- **Clean Uninstallation**: Complete removal with no leftover files or registry entries  
- **干净卸载**：完全移除，无残留文件或注册表项
- **Path Management**: Automatic PATH configuration without pollution  
- **路径管理**：自动 PATH 配置，不会污染系统环境
- **Version Control**: Easily switch between versions if needed  
- **版本控制**：如需，可轻松在不同版本间切换
- **Isolated Environment**: All files contained within your Scoop directory  
- **隔离环境**：所有文件都包含在 Scoop 目录内
- **Update Simplicity**: One command to check and install updates (`scoop update iceweasel`)  
- **更新简便**：一条命令即可检查并安装更新（`scoop update iceweasel`）

## 📜 License

## 📜 许可证

This Scoop bucket is not affiliated with the Iceweasel project. Iceweasel is licensed under the Mozilla Public License 2.0 (MPL-2.0). This installation method simply provides a convenient way to manage the browser through Scoop.

此 Scoop 源与 Iceweasel 项目无关联。Iceweasel 采用 Mozilla 公共许可证 2.0 版 (MPL-2.0) 授权。此安装方法仅提供了一种通过 Scoop 管理浏览器的便捷方式。

## 🤝 Support

## 🤝 支持

For issues with the Scoop package:  
有关 Scoop 软件包的问题：
- [Open an issue](https://github.com/xiaozuo1120/scoop-iceweasel/issues) in this repository  
- 在[此仓库提交问题](https://github.com/xiaozuo1120/scoop-iceweasel/issues)

For issues with Iceweasel itself:  
有关 Iceweasel 本身的问题：
- [Report to Iceweasel developers](https://github.com/adonais/iceweasel/issues)  
- [向 Iceweasel 开发者报告](https://github.com/adonais/iceweasel/issues)

---

> **Note**: Since hash verification is disabled, you're trusting the upstream publisher when installing updates. Only proceed if you understand and accept this security model.  
> **注意**：由于哈希验证已禁用，安装更新时您需要信任上游发布者。仅在您理解并接受此安全模型时继续操作。
