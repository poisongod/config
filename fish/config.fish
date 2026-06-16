if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx $_fish_config $__fish_config_dir/config.fish

function 2bin
    set file (path basename $argv[1])
    if not test -x $argv
        chmod +x $argv
    end
    if not test -f $bin/$file
        ln -sf $argv[1] $bin/$file
    end
end


# HOME root
set -gx root $HOME/.root

set -l env bin local tmp
for i in $env
    set -gx $i $root/$i
    if not test -d $$i
        mkdir -p $$i
    end
end

set -a PATH $bin

# root local
for i in $local/*
    set file (path basename $i).fish
    if not test -f $i/$file
        echo "#!/bin/env fish" >$i/$file
    end

    chmod +x $i/$file && source $i/$file
end

# Dynamic PWD PATH
set -a PATH ./
function update_path_pwd --on-variable PWD
    set -e PATH[-1]
    set -a PATH ./
end

update_path_pwd
