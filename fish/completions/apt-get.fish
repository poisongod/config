# Fish completion for apt-get
# Termux 完整补全 — 子命令 + 选项 + 包名

complete -c apt-get -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c apt-get -f -n "__fish_use_subcommand" -xa "update" -d "更新包索引"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "upgrade" -d "升级包"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "dist-upgrade" -d "发行版升级"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "dselect-upgrade" -d "配合 dselect 使用"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "install" -d "安装包"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "remove" -d "移除包"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "purge" -d "移除包及配置"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "autoremove" -d "自动移除未使用的依赖"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "autopurge" -d "自动移除未使用的依赖及配置"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "source" -d "下载源码包"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "build-dep" -d "安装构建依赖"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "check" -d "更新缓存并检查依赖"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "clean" -d "清除本地缓存"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "autoclean" -d "清除旧缓存"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "changelog" -d "显示更新日志"
complete -c apt-get -f -n "__fish_use_subcommand" -xa "download" -d "下载包二进制文件"

# ── 包名补全 ───────────────────────────────────────────────────────
complete -c apt-get -f -n "__fish_seen_subcommand_from install purge build-dep changelog download source" \
    -xa "(apt-cache pkgnames 2>/dev/null)"

complete -c apt-get -f -n "__fish_seen_subcommand_from remove" \
    -xa "(dpkg-query -W -f '\${Package}\n' 2>/dev/null)"

# .deb 文件补全由 Fish 默认机制处理

# ── 全局选项 ────────────────────────────────────────────────────────
complete -c apt-get -f -s h -l help -d "显示帮助"
complete -c apt-get -f -s v -l version -d "显示版本"
complete -c apt-get -f -s y -l yes -l assume-yes -d "自动确认"
complete -c apt-get -f -l assume-no -d "自动拒绝"
complete -c apt-get -f -s d -l download-only -d "仅下载"
complete -c apt-get -f -s f -l fix-broken -d "修复损坏依赖"
complete -c apt-get -f -s m -l fix-missing -d "忽略缺失包"
complete -c apt-get -f -s q -l quiet -d "静默模式"
complete -c apt-get -f -s s -l simulate -l dry-run -l just-print -l recon -l no-act -d "模拟运行"
complete -c apt-get -f -s u -l show-upgraded -d "显示升级的包"
complete -c apt-get -f -s V -l verbose-versions -d "显示完整版本号"
complete -c apt-get -f -s b -l compile -l build -d "编译源码"
complete -c apt-get -f -s t -l target-release -l default-release -d "指定目标发行版" -r
complete -c apt-get -f -s o -l option -d "设置配置选项" -r
complete -c apt-get -f -s c -l config-file -d "指定配置文件" -r
complete -c apt-get -f -l no-install-recommends -d "不安装推荐包"
complete -c apt-get -f -l install-recommends -d "安装推荐包"
complete -c apt-get -f -l no-install-suggests -d "不安装建议包"
complete -c apt-get -f -l install-suggests -d "安装建议包"
complete -c apt-get -f -l no-download -d "禁止下载"
complete -c apt-get -f -l ignore-hold -d "忽略包保持"
complete -c apt-get -f -l no-upgrade -d "不升级包"
complete -c apt-get -f -l force-yes -d "强制确认"
complete -c apt-get -f -l print-uris -d "打印 URI"
complete -c apt-get -f -l purge -d "使用 purge 替代 remove"
complete -c apt-get -f -l reinstall -d "重新安装"
complete -c apt-get -f -l trivial-only -d "仅执行微小操作"
complete -c apt-get -f -l no-remove -d "如需移除则中止"
complete -c apt-get -f -l only-source -d "仅接受源码包"
complete -c apt-get -f -l diff-only -d "仅下载 diff 文件"
complete -c apt-get -f -l tar-only -d "仅下载 tar 文件"
complete -c apt-get -f -l arch-only -d "仅处理架构相关构建依赖"
complete -c apt-get -f -l allow-unauthenticated -d "允许未认证包"
complete -c apt-get -f -l allow-downgrades -d "允许降级"
complete -c apt-get -f -l allow-remove-essential -d "允许移除必要包"
complete -c apt-get -f -l allow-change-held-packages -d "允许修改保持状态"
