#!/bin/bash
set -euo pipefail

# 配置
SCRIPT_NAME="pip-switch"
GLOBAL_BIN="/usr/local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/你的用户名/pip-switch/main/pip-switch"  # 替换为你的 GitHub 地址
INSTALL_PATH="${GLOBAL_BIN}/${SCRIPT_NAME}"

# 颜色
GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

# 检查是否为 root（避免权限问题）
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${YELLOW}[提示] 需要管理员权限，将使用 sudo 执行安装${RESET}"
        # 重新以 sudo 运行脚本
        exec sudo "$0" "$@"
    fi
}

# 安装逻辑
install() {
    echo -e "${GREEN}[开始安装] pip-switch 工具${RESET}"
    
    # 1. 下载主脚本到全局目录
    echo -e "[步骤1/3] 下载脚本..."
    if command -v curl &> /dev/null; then
        curl -fsSL "$SCRIPT_URL" -o "$INSTALL_PATH"
    elif command -v wget &> /dev/null; then
        wget -q "$SCRIPT_URL" -O "$INSTALL_PATH"
    else
        echo -e "${RED}[错误] 未找到 curl 或 wget，请先安装其中一个${RESET}"
        exit 1
    fi
    
    # 2. 设置执行权限
    echo -e "[步骤2/3] 设置执行权限..."
    chmod +x "$INSTALL_PATH"
    
    # 3. 验证安装
    echo -e "[步骤3/3] 验证安装..."
    if command -v "$SCRIPT_NAME" &> /dev/null; then
        echo -e "${GREEN}[安装成功！] 输入 ${YELLOW}pip-switch${GREEN} 即可使用${RESET}"
    else
        echo -e "${YELLOW}[警告] 脚本已安装，但未在 PATH 中找到${RESET}"
        echo -e "请手动添加 PATH：export PATH=\"${GLOBAL_BIN}:\$PATH\""
        echo -e "然后执行：source ~/.zshrc 或 source ~/.bashrc"
    fi
}

# 卸载逻辑
uninstall() {
    echo -e "${YELLOW}[开始卸载] pip-switch 工具${RESET}"
    
    if [ -f "$INSTALL_PATH" ]; then
        rm -f "$INSTALL_PATH"
        echo -e "${GREEN}[卸载成功！] 已删除 ${INSTALL_PATH}${RESET}"
    else
        echo -e "${RED}[错误] 未找到 pip-switch 安装文件${RESET}"
        exit 1
    fi
}

# 主逻辑
main() {
    if [ $# -eq 1 ] && [ "$1" = "uninstall" ]; then
        check_root
        uninstall
        exit 0
    fi
    
    check_root
    install
}

main "$@"
