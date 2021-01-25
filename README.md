# Emyrk's Dotfiles

The script [`install.sh`](install.sh) is idempotent. It will install all the settings that I use in my terminal for development work. 

This script currently works for Debian and Arch based os's.

# Install

```bash
git clone git@github.com:Emyrk/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

# Design 

All files in `install_scripts` are used by `install.sh` to configure the environment.

All the custom shell files should reside in `/system`.

```
└── system
    ├── append :: All these files will append to their 
    |             paired files in $HOME. This allows modifying
    |             existing files without removing them.
    ├── replace :: This directory replaces the files in $HOME
    |              symlinking the files to this dotfiles directory.
    ├── scripts :: Replaces all files in $HOME/system/scripts
    |              symlinking the files to this dotfiles directory.
    └── system :: Replaces all files in $HOME/system/system
                  symlinking the files to this dotfiles directory.
```


# TODO:

- Terminal profile export
 - https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile