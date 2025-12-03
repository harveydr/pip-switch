#!/bin/bash
set -euo pipefail

# 配置（仅保留 GitHub 源）
SCRIPT_NAME="pip-switch"
GLOBAL_BIN="/usr/local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/harveydr/pip-switch/main/pip-switch"
INSTALL_PATH="${GLOBAL_BIN}/${SCRIPT_NAME}"

# 颜色配置
GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

# 核心：权限预授权（模仿 Homebrew，避免管道中 read 输入）
check_and_prompt_sudo() {
    if [ "$(id -u)" -eq 0 ]; then
        return 0
    fi
    echo -e "${YELLOW}==> 需要管理员权限安装 ${SCRIPT_NAME}，请输入你的系统密码（输入时不显示字符）${RESET}"
    if ! sudo -v; then
        echo -e "\n${RED}==> 密码输入错误或取消授权，安装失败${RESET}"
        exit 1
    fi
    # 保持 sudo 权限会话（每 60 秒刷新一次）
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

# 下载主脚本（用 sudo 确保写入全局目录权限）
download_script() {
    echo -e "${GREEN}==> 正在从 GitHub 下载 ${SCRIPT_NAME} 主脚本...${RESET}"
    if command -v curl &> /dev/null; then
        sudo curl -fsSL --progress-bar "$SCRIPT_URL" -o "$INSTALL_PATH"
    elif command -v wget &> /dev/null; then
        sudo wget -q --show-progress "$SCRIPT_URL" -O "$INSTALL_PATH"
    else
        echo -e "${RED}==> 错误：未找到 curl 或 wget，请先安装其中一个工具${RESET}"
        exit 1
    fi
}

# 设置执行权限
set_permissions() {
    echo -e "${GREEN}==> 正在设置全局执行权限...${RESET}"
    sudo chmod +x "$INSTALL_PATH"
}

# 验证安装（新增卸载命令提示）
verify_install() {
    echo -e "${GREEN}==> 正在验证安装...${RESET}"
    if command -v "$SCRIPT_NAME" &> /dev/null; then
        echo -e "\n${GREEN}✅ 安装成功！${RESET}"
        echo -e "${YELLOW}==> 常用命令：${RESET}"
        echo -e "  1. 启动工具：${SCRIPT_NAME}"
        echo -e "  2. 一键卸载：${SCRIPT_NAME} uninstall"
    else
        echo -e "\n${YELLOW}⚠️  脚本已安装，但未在 PATH 中检测到${RESET}"
        echo -e "==> 请执行以下命令刷新 PATH："
        echo -e "export PATH=\"${GLOBAL_BIN}:\$PATH\" && source ~/.zshrc"
        echo -e "==> 之后输入 ${SCRIPT_NAME} 即可使用"
    fi
}

# 卸载逻辑（兼容旧的 curl 卸载方式，主要卸载逻辑在主脚本）
uninstall() {
    echo -e "${YELLOW}==> 正在卸载 ${SCRIPT_NAME} 工具...${RESET}"
    if [ -f "$INSTALL_PATH" ]; then
        sudo rm -f "$INSTALL_PATH"
        echo -e "${GREEN}✅ 卸载成功！已删除全局命令：${INSTALL_PATH}${RESET}"
    else
        echo -e "${RED}❌ 错误：未检测到 ${SCRIPT_NAME} 已安装${RESET}"
        exit 1
    fi
}

# 主流程
main() {
    # 欢迎信息（模仿 Homebrew 风格）
    echo -e "${GREEN}========================================"${RESET}
    echo -e "${YELLOW}  ${SCRIPT_NAME} 一键安装工具 v1.0（GitHub 版）${RESET}"
    echo -e "${GREEN}========================================"${RESET}

    # 区分安装/卸载（兼容旧方式）
    if [ $# -eq 1 ] && [ "$1" = "uninstall" ]; then
        check_and_prompt_sudo
        uninstall
        exit 0
    fi

    # 安装流程
    check_and_prompt_sudo
    download_script
    set_permissions
    verify_install

    echo -e "\n${GREEN}🎉 感谢使用 ${SCRIPT_NAME}！${RESET}"
}

main "$@"
