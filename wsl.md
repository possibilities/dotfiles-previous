# WSL

* Create backup from previous system
  * `./backup.sh`

* From host system
  * Install WSL2: https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/
  * Run regedits for fixing key mappings
  * Install apps
    * Divvy (NOTE consider installed after so that we don't have to kill before restore)
    * Sharex (NOTE consider installed after so that we don't have to kill before restore)
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
  * NOTE: kill sharex and divvy before restoring (or try installing after as noted above)
  * Restore backups: `sudo ./restore.sh`
  * Run install: cd ~/code/dotfiles && ./install.sh
