#!/bin/bash
set -euo pipefail

# 配置（已适配你的仓库）
SCRIPT_NAME="pip-switch"
GLOBAL_BIN="/usr/local/bin"
# 主脚本的原始文件地址
SCRIPT_URL="https://raw.githubusercontent.com/harveydr/pip-switch/main/pip-switch"
INSTALL_PATH="${GLOBAL_BIN}/${SCRIPT_NAME}"

# 颜色配置
GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

# 检查并切换到管理员权限（支持管道模式输入密码）
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${YELLOW}[提示] 需要管理员权限，请输入你的系统密码：${RESET}"
        # 隐藏密码输入，适配管道模式
        if ! read -s password; then
            echo -e "\n${RED}[错误] 密码输入失败，请重新执行命令${RESET}"
            exit 1
        fi
        # 以 root 权限重新执行脚本
        echo "$password" | sudo -S bash -c "$(cat "$0")" "$@"
        exit $?
    fi
}

# 安装逻辑
install() {
    echo -e "${GREEN}[开始安装] pip-switch 工具${RESET}"
    
    # 步骤1：下载主脚本到全局目录
    echo -e "[步骤1/3] 下载脚本..."
    if command -v curl &> /dev/null; then
        curl -fsSL "$SCRIPT_URL" -o "$INSTALL_PATH"
    elif command -v wget &> /dev/null; then
        wget -q "$SCRIPT_URL" -O "$INSTALL_PATH"
    else
        echo -e "${RED}[错误] 未找到 curl 或 wget，请先安装其中一个工具${RESET}"
        exit 1
    fi
    
    # 步骤2：设置脚本执行权限
    echo -e "[步骤2/3] 设置执行权限..."
    chmod +x "$INSTALL_PATH"
    
    # 步骤3：验证安装是否成功
    echo -e "[步骤3/3] 验证安装..."
    if command -v "$SCRIPT_NAME" &> /dev/null; then
        echo -e "${GREEN}[安装成功！] 输入 ${YELLOW}${SCRIPT_NAME}${GREEN} 即可使用工具${RESET}"
    else
        echo -e "${YELLOW}[警告] 脚本已安装，但未在 PATH 中检测到${RESET}"
        echo -e "请手动添加 PATH：export PATH=\"${GLOBAL_BIN}:\$PATH\""
        echo -e "然后执行：source ~/.bashrc 或 source ~/.zshrc"
    fi
}

# 卸载逻辑
uninstall() {
    echo -e "${YELLOW}[开始卸载] pip-switch 工具${RESET}"
    
    if [ -f "$INSTALL_PATH" ]; then
        rm -f "$INSTALL_PATH"
        echo -e "${GREEN}[卸载成功！] 已删除全局命令：${INSTALL_PATH}${RESET}"
    else
        echo -e "${RED}[错误] 未检测到 pip-switch 已安装${RESET}"
        exit 1
    fi
}

# 主逻辑（区分安装/卸载）
main() {
    check_root "$@"
    
    if [ $# -eq 1 ] && [ "$1" = "uninstall" ]; then
        uninstall
        exit 0
    fi
    
    install
}

main "$@"
