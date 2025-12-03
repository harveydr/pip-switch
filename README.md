# pip-switch 🔄
一个简单高效的 pip 软件源切换工具，支持临时/永久切换阿里云、清华等国内高速源，一键安装，全局可用！

<div align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS-green.svg" alt="Platform">
  <img src="https://img.shields.io/badge/version-v1.0-orange.svg" alt="Version">
  <img src="https://img.shields.io/badge/install-1%20line-blueviolet.svg" alt="One-line Install">
</div>


## 🎯 核心功能
- ✅ **仿 Homebrew 一键安装**：一行命令直达，无需手动下载文件
- ✅ **双模式切换**：临时切换（仅当前终端生效）/永久切换（全局配置生效）
- ✅ **7 大国内高速源**：内置阿里云、清华、豆瓣、腾讯云等优质源
- ✅ **自动兼容**：智能检测 `pip`/`pip3`，适配 Python 2/3 环境
- ✅ **清晰交互**：彩色提示、步骤可视化，操作零门槛
- ✅ **一键卸载**：支持一行命令彻底清理，无残留


## 📸 效果演示
（替换为你的工具运行截图，增强直观性）
![pip-switch 演示](https://user-images.githubusercontent.com/harveydr/blob/main/screen.png)


## 🚀 一键安装
打开终端，直接执行以下命令（macOS/Linux 通用）：
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/harveydr/pip-switch/main/install.sh)"
```

### 安装流程说明
1. 执行命令后，会提示输入系统密码（用于管理员权限授权，输入时不显示字符）
2. 自动下载主脚本 → 设置全局执行权限 → 验证安装
3. 安装成功后，直接输入 `pip-switch` 即可启动工具


## 📖 使用方法
1. 启动工具：终端输入以下命令（任何目录均可）
   ```bash
   pip-switch
   ```
2. 按菜单提示操作：
   - 1. 临时切换源：仅当前终端生效，关闭终端自动恢复
   - 2. 永久切换源：写入 pip 全局配置，所有终端长期生效
   - 3. 恢复默认源：重置为 PyPI 官方源
   - 4. 查看当前源：显示当前生效的源名称和地址
   - 5. 退出：关闭工具


## 📦 内置软件源列表
| 序号 | 源名称   | 源地址                                      | 特点                     |
|------|----------|---------------------------------------------|--------------------------|
| 1    | 默认源   | https://pypi.org/simple/                    | 官方源，全球通用         |
| 2    | 阿里云   | https://mirrors.aliyun.com/pypi/simple/     | 国内速度快，稳定性高     |
| 3    | 清华大学 | https://pypi.tuna.tsinghua.edu.cn/simple/   | 学术镜像，更新及时       |
| 4    | 豆瓣     | https://pypi.doubanio.com/simple/           | 访问速度快，无并发限制   |
| 5    | 腾讯云   | https://mirrors.cloud.tencent.com/pypi/simple/ | 腾讯云节点，适合南方用户 |
| 6    | 华为云   | https://repo.huaweicloud.com/repository/pypi/simple/ | 企业级镜像，稳定性强     |
| 7    | 中科大   | https://pypi.mirrors.ustc.edu.cn/simple/    | 老牌镜像，学术环境友好   |


## 🗑️ 一键卸载（无残留）
执行以下命令即可彻底卸载，无需手动清理文件：
```bash
pip-switch uninstall
```


## 📋 系统要求
- 操作系统：Linux（Ubuntu/CentOS/Debian 等）或 macOS
- 依赖环境：已安装 Python + `pip`/`pip3`，系统自带 `curl` 或 `wget`（大部分系统默认预装）
- 权限要求：需要管理员权限（安装时输入系统密码即可）


## ❌ 常见问题排查
### 1. 安装时提示“无法访问 raw.githubusercontent.com”
解决：采用科学上网工具。

### 2. 执行 `pip-switch` 提示“command not found”
解决：手动刷新 PATH 配置（适配 zsh/bash）
```bash
# 刷新 PATH（zsh 用户）
export PATH="/usr/local/bin:$PATH" && source ~/.zshrc

# 刷新 PATH（bash 用户）
export PATH="/usr/local/bin:$PATH" && source ~/.bashrc
```

### 3. 安装时密码输入后提示“权限不足”
解决：直接用 sudo 执行安装命令（强制授权）
```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/harveydr/pip-switch/main/install.sh)"
```


## 📄 许可证
本项目采用 MIT 许可证开源，详见 [LICENSE](LICENSE) 文件。你可以自由使用、修改和分发本工具，无需额外授权。


## 💡 反馈与贡献
- 遇到问题：欢迎在 GitHub Issues 提交反馈（附错误截图和操作步骤）
- 功能建议：直接提交 Pull Request 或在 Issues 中留言
- 仓库地址：[https://github.com/harveydr/pip-switch](https://github.com/harveydr/pip-switch)
