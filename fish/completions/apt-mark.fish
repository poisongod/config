# Fish completion for apt-mark
# Termux 完整补全 — 子命令 + 选项 + 包名

complete -c apt-mark -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "auto" -d "标记为自动安装"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "manual" -d "标记为手动安装"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "hold" -d "保持包版本"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "unhold" -d "取消保持"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "showauto" -d "列出自动安装的包"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "showmanual" -d "列出手动安装的包"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "showhold" -d "列出保持的包"
complete -c apt-mark -f -n "__fish_use_subcommand" -xa "minimize-manual" -d "将元包依赖标记为自动"

# ── 包名补全 ───────────────────────────────────────────────────────
complete -c apt-mark -f -n "__fish_seen_subcommand_from auto manual hold" \
    -xa "(apt-cache pkgnames 2>/dev/null)"

complete -c apt-mark -f -n "__fish_seen_subcommand_from unhold" \
    -xa "(dpkg-query -W -f '\${Package}\n' 2>/dev/null)"

# ── 选项 ────────────────────────────────────────────────────────────
complete -c apt-mark -f -s h -l help -d "显示帮助"
complete -c apt-mark -f -s v -l version -d "显示版本"
complete -c apt-mark -f -s f -l file -d "从文件读取包统计" -r -xa "(__fish_complete_path)"
complete -c apt-mark -f -s o -l option -d "设置配置选项" -r
complete -c apt-mark -f -s c -l config-file -d "配置文件" -r
complete -c apt-mark -f -l color -d "启用彩色输出"
complete -c apt-mark -f -l no-color -d "禁用彩色输出"
