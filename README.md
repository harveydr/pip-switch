# pip-switch 🔄
一个简单、高效的 pip 软件源切换工具，支持临时/永久切换，国内源一键到位！

<div align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS-green.svg" alt="Platform">
  <img src="https://img.shields.io/badge/version-v1.0-orange.svg" alt="Version">
</div>

## 🎯 功能特点
- ✅ **自动兼容**：自动检测 `pip`/`pip3`，适配 Python 2/3
- ✅ **双模式切换**：临时切换（仅当前终端生效）/永久切换（全局配置生效）
- ✅ **优质内置源**：阿里云、清华、豆瓣等 7 个国内高速源
- ✅ **富文本交互**：成功/错误提示清晰醒目，操作流程直观
- ✅ **一键安装**：1 行命令完成安装，全局可用

## 📸 效果演示
（可替换为你的工具运行截图）
![pip-switch 演示](https://user-images.githubusercontent.com/你的GitHubID/你的截图文件名.png)

## 🚀 快速安装
打开终端，执行以下命令（兼容 Linux/macOS）：

### 方式1：用 curl 安装
```bash
curl -fsSL https://raw.githubusercontent.com/你的GitHub用户名/pip-switch/main/install.sh | bash
```

### 方式2：用 wget 安装
```bash
wget -qO- https://raw.githubusercontent.com/你的GitHub用户名/pip-switch/main/install.sh | bash
```

## 📖 使用方法
安装完成后，直接在终端输入命令启动工具：
```bash
pip-switch
```

启动后会显示菜单，按提示选择操作：
1. **临时切换源**：仅当前终端生效，关闭终端后恢复默认
2. **永久切换源**：写入 pip 全局配置，所有终端生效
3. **恢复默认源**：重置为 PyPI 官方源
4. **查看当前源**：显示当前生效的源名称和地址
5. **退出**：关闭工具


## 📦 内置软件源列表
| 序号 | 源名称   | 源地址                                      |
|------|----------|---------------------------------------------|
| 1    | 默认源   | https://pypi.org/simple/                    |
| 2    | 阿里云   | https://mirrors.aliyun.com/pypi/simple/     |
| 3    | 清华大学 | https://pypi.tuna.tsinghua.edu.cn/simple/   |
| 4    | 豆瓣     | https://pypi.doubanio.com/simple/           |
| 5    | 腾讯云   | https://mirrors.cloud.tencent.com/pypi/simple/ |
| 6    | 华为云   | https://repo.huaweicloud.com/repository/pypi/simple/ |
| 7    | 中科大   | https://pypi.mirrors.ustc.edu.cn/simple/    |


## 🗑️ 卸载方法
执行以下命令一键卸载：
```bash
curl -fsSL https://raw.githubusercontent.com/你的GitHub用户名/pip-switch/main/install.sh | bash -s uninstall
```


## 📋 系统要求
- 操作系统：Linux（Ubuntu/CentOS 等）或 macOS
- 依赖：已安装 Python + `pip`/`pip3`，以及 `curl` 或 `wget`（用于下载）


## 📄 许可证
本项目采用 MIT 许可证开源，详见 [LICENSE](LICENSE) 文件。


## 💡 反馈与贡献
- 遇到问题：请在 GitHub Issues 提交反馈
- 改进建议：欢迎提交 Pull Request
