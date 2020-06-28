# WSL

* Create backup from previous system
  * `./backup.sh`

* From host system
  * Install WSL2: https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/
  * Run regedits for fixing key mappings
  * Install apps
    * Divvy
    * Sharex
    * IB 3270 font: https://github.com/rbanffy/3270font
    * XLaunch: https://sourceforge.net/projects/vcxsrv/
    * GitBash: https://gitforwindows.org/
    * WSLtty: https://github.com/mintty/wsltty/releases
  * Extract home.tar to Windows ~/backup
    ```
    cp D:/home.tgz C:/Users/mike/home.tgz
    cd C:/Users/mike
    tar zxvfp home.tgz
    ```

* Inside WSL
  * Copy dotfiles from backup: mkdir -p ~/code && cp -r /mnt/c/Users/mike/home/mike/code/dotfiles ~/code/dotfiles
  * Run install: cd ~/code/dotfiles && ./install.sh
  * Restore backups: /mnt/c/Users/mike/home/mike/code/dotfiles/restore.sh
