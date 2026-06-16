# Fish completion for Termux pkg
# 完整补全 — 子命令 + 选项 + 包名
# 覆盖 FreeBSD pkgng 系统补全 (非 BSD 系统上 exit)

complete -c pkg -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c pkg -f -n "__fish_use_subcommand" -xa "install" -d "安装包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "uninstall" -d "卸载包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "reinstall" -d "重新安装包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "update" -d "更新 apt 仓库数据库"
complete -c pkg -f -n "__fish_use_subcommand" -xa "upgrade" -d "升级所有已安装包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "search" -d "搜索包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "show" -d "显示包信息"
complete -c pkg -f -n "__fish_use_subcommand" -xa "files" -d "显示包安装的文件列表"
complete -c pkg -f -n "__fish_use_subcommand" -xa "list-installed" -d "列出已安装包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "list-all" -d "列出所有可用包"
complete -c pkg -f -n "__fish_use_subcommand" -xa "autoclean" -d "清除旧的 deb 缓存"
complete -c pkg -f -n "__fish_use_subcommand" -xa "clean" -d "清除全部 deb 缓存"

# ── 全局选项 ────────────────────────────────────────────────────────
complete -c pkg -f -n "__fish_use_subcommand" -l check-mirror -d "强制重新检查镜像可用性"

# ── 包名补全 ───────────────────────────────────────────────────────
complete -c pkg -f -n "__fish_seen_subcommand_from install reinstall show files" \
    -xa "(apt-cache pkgnames 2>/dev/null)"

complete -c pkg -f -n "__fish_seen_subcommand_from uninstall" \
    -xa "(dpkg-query -W -f '\${Package}\n' 2>/dev/null)"
