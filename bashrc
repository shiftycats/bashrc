# .bashrc 

# Test for an interactive shell
if [ $- != *i* ]; then
    return
fi

# Load settings from ~/.bashrc.d
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# vim: ft=sh:expandtab:ts=4:sw=4
