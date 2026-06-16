# Fish completion for apt
# Termux 完整补全 — 子命令 + 选项 + 包名

# 包名补全函数 — 不依赖系统 __fish_print_apt_packages
function __fish_apt_packages
    apt-cache pkgnames 2>/dev/null
end

function __fish_apt_installed_packages
    dpkg-query -W -f '${Package}\n' 2>/dev/null
end

# 禁止文件名补全
complete -c apt -f

# ── 子命令 ──────────────────────────────────────────────────────────
complete -c apt -n "__fish_use_subcommand" -f -xa "update" -d "更新可用包列表"
complete -c apt -n "__fish_use_subcommand" -f -xa "upgrade" -d "升级系统"
complete -c apt -n "__fish_use_subcommand" -f -xa "full-upgrade" -d "升级（可移除/安装包）"
complete -c apt -n "__fish_use_subcommand" -f -xa "install" -d "安装包"
complete -c apt -n "__fish_use_subcommand" -f -xa "reinstall" -d "重新安装包"
complete -c apt -n "__fish_use_subcommand" -f -xa "remove" -d "移除包"
complete -c apt -n "__fish_use_subcommand" -f -xa "purge" -d "移除包及配置文件"
complete -c apt -n "__fish_use_subcommand" -f -xa "autoremove" -d "自动移除未使用的依赖"
complete -c apt -n "__fish_use_subcommand" -f -xa "autopurge" -d "自动移除未使用的依赖及配置"
complete -c apt -n "__fish_use_subcommand" -f -xa "show" -d "显示包详情"
complete -c apt -n "__fish_use_subcommand" -f -xa "search" -d "搜索包描述"
complete -c apt -n "__fish_use_subcommand" -f -xa "list" -d "按条件列出包"
complete -c apt -n "__fish_use_subcommand" -f -xa "edit-sources" -d "编辑源列表"
complete -c apt -n "__fish_use_subcommand" -f -xa "satisfy" -d "满足依赖字符串"
complete -c apt -n "__fish_use_subcommand" -f -xa "depends" -d "显示包依赖"
complete -c apt -n "__fish_use_subcommand" -f -xa "rdepends" -d "显示反向依赖"
complete -c apt -n "__fish_use_subcommand" -f -xa "policy" -d "显示源/包优先级"
complete -c apt -n "__fish_use_subcommand" -f -xa "changelog" -d "下载并显示更新日志"
complete -c apt -n "__fish_use_subcommand" -f -xa "download" -d "下载包"
complete -c apt -n "__fish_use_subcommand" -f -xa "source" -d "下载源码包"
complete -c apt -n "__fish_use_subcommand" -f -xa "build-dep" -d "安装构建依赖"
complete -c apt -n "__fish_use_subcommand" -f -xa "showsrc" -d "显示源码包信息"
complete -c apt -n "__fish_use_subcommand" -f -xa "clean" -d "清除缓存"
complete -c apt -n "__fish_use_subcommand" -f -xa "autoclean" -d "清除旧缓存"

# ── 包名补全 ───────────────────────────────────────────────────────
complete -c apt -f -n "__fish_seen_subcommand_from install reinstall show purge depends rdepends policy changelog download source build-dep showsrc" \
    -xa "(apt-cache pkgnames)"

complete -c apt -f -n "__fish_seen_subcommand_from remove" \
    -xa "(dpkg-query -W -f '\${Package}\n' 2>/dev/null)"

# ── 全局选项 ────────────────────────────────────────────────────────
complete -c apt -f -s h -l help -d "显示帮助"
complete -c apt -f -s v -l version -d "显示版本"
complete -c apt -f -s y -l yes -l assume-yes -d "自动确认"
complete -c apt -f -l assume-no -d "自动拒绝"
complete -c apt -f -s d -l download-only -d "仅下载"
complete -c apt -f -s f -l fix-broken -d "修复损坏依赖"
complete -c apt -f -s m -l fix-missing -d "忽略缺失包"
complete -c apt -f -s q -l quiet -d "静默模式"
complete -c apt -f -s s -l simulate -l dry-run -l just-print -l recon -l no-act -d "模拟运行"
complete -c apt -f -s u -l show-upgraded -d "显示升级的包"
complete -c apt -f -s V -l verbose-versions -d "显示完整版本号"
complete -c apt -f -s b -l compile -l build -d "编译源码"
complete -c apt -f -s t -l target-release -l default-release -d "指定目标发行版" -r
complete -c apt -f -s o -l option -d "设置配置选项" -r
complete -c apt -f -s c -l config-file -d "指定配置文件" -r
complete -c apt -f -l no-install-recommends -d "不安装推荐包"
complete -c apt -f -l install-recommends -d "安装推荐包"
complete -c apt -f -l no-install-suggests -d "不安装建议包"
complete -c apt -f -l install-suggests -d "安装建议包"
complete -c apt -f -l no-download -d "禁止下载"
complete -c apt -f -l ignore-hold -d "忽略包保持"
complete -c apt -f -l no-upgrade -d "不升级包"
complete -c apt -f -l allow-unauthenticated -d "允许未认证包"
complete -c apt -f -l allow-downgrades -d "允许降级"
complete -c apt -f -l allow-remove-essential -d "允许移除必要包"
complete -c apt -f -l allow-change-held-packages -d "允许修改保持状态"
complete -c apt -f -l with-new-pkgs -d "允许安装新包"
complete -c apt -f -l fix-policy -d "修复策略"

# list 子命令专有选项
complete -c apt -f -n "__fish_seen_subcommand_from list" -l installed -d "已安装的包"
complete -c apt -f -n "__fish_seen_subcommand_from list" -l upgradable -d "可升级的包"
complete -c apt -f -n "__fish_seen_subcommand_from list" -l manual-installed -d "手动安装的包"
complete -c apt -f -n "__fish_seen_subcommand_from list" -s a -l all-versions -d "所有版本"
complete -c apt -f -n "__fish_seen_subcommand_from list" -l verbose -d "详细输出"

# install 专有选项
complete -c apt -f -n "__fish_seen_subcommand_from install" -l reinstall -d "重新安装"
