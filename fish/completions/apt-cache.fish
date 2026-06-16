# Fish completion for apt-cache
# Termux 完整补全 — 子命令 + 选项 + 包名

complete -c apt-cache -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "show" -d "显示包记录"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "search" -d "按正则搜索包"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "depends" -d "显示包依赖"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "rdepends" -d "显示反向依赖"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "showpkg" -d "显示包信息"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "showsrc" -d "显示源码包"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "stats" -d "显示缓存统计"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "dump" -d "转储缓存中所有包"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "dumpavail" -d "打印可用列表"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "unmet" -d "列出未满足的依赖"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "pkgnames" -d "按前缀列出包名"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "dotty" -d "生成 dotty 输出"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "policy" -d "显示策略配置"
complete -c apt-cache -f -n "__fish_use_subcommand" -xa "gencaches" -d "构建 apt 缓存"

# ── 包名补全 ───────────────────────────────────────────────────────
complete -c apt-cache -f -n "__fish_seen_subcommand_from show showpkg showsrc depends rdepends policy" \
    -xa "(apt-cache pkgnames 2>/dev/null)"

# ── 选项 ────────────────────────────────────────────────────────────
complete -c apt-cache -f -s h -l help -d "显示帮助"
complete -c apt-cache -f -s v -l version -d "显示版本"
complete -c apt-cache -f -s p -l pkg-cache -d "包缓存文件" -r
complete -c apt-cache -f -s s -l src-cache -d "源码缓存文件" -r
complete -c apt-cache -f -s q -l quiet -d "静默模式"
complete -c apt-cache -f -s i -l important -d "打印重要依赖"
complete -c apt-cache -f -s a -l all-versions -d "打印完整记录"
complete -c apt-cache -f -s g -l generate -d "自动生成包缓存"
complete -c apt-cache -f -l all-names -d "打印所有名称"
complete -c apt-cache -f -l recurse -d "递归依赖"
complete -c apt-cache -f -l installed -d "仅限已安装"
complete -c apt-cache -f -l full -d "完整搜索"
complete -c apt-cache -f -l names-only -d "仅搜索包名"
complete -c apt-cache -f -s o -l option -d "设置配置选项" -r
complete -c apt-cache -f -s c -l config-file -d "配置文件" -r
