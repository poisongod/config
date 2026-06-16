# Fish completion for apt-config
# Termux 完整补全

complete -c apt-config -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c apt-config -f -n "__fish_use_subcommand" -xa "dump" -d "显示当前配置"
complete -c apt-config -f -n "__fish_use_subcommand" -xa "shell" -d "通过 shell 获取配置值"

# ── 选项 ────────────────────────────────────────────────────────────
complete -c apt-config -f -s h -l help -d "显示帮助"
complete -c apt-config -f -s v -l version -d "显示版本"
complete -c apt-config -f -s o -l option -d "设置配置选项" -r
complete -c apt-config -f -s c -l config-file -d "配置文件" -r
