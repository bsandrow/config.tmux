#!/usr/bin/env zsh

PREFIX=$1
PREFIX=${PREFIX:-$HOME}

function abspath()
{
    case "$(uname)" in
        Darwin)
            perl -e 'use Cwd qw(abs_path); printf("%s\n", abs_path($ARGV[0]));' "$1"
            ;;
        *)
            readlink -f "$1"
            ;;
    esac
}

CONF_DIR="${0%/*}"
FILES=(tmux.conf)

if [ $(uname) = "Darwin" ]; then
    ln -v -sfn "$(abspath "tmux.osx.conf")" "$PREFIX/.tmux.conf"
else
    ln -v -sfn "$(abspath "tmux.conf")" "$PREFIX/.tmux.conf"
fi

# vim:set ft=zsh:
