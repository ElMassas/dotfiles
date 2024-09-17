# dotfiles

Useful dotfiles to easily and quickly set up a work environment to my own taste with some specific concerns.




### XDG directories

XDG Directories are respected by most modern applications and help to maintain a structured and organized environment.


Variable | Location
--- | ---
`XDG_CONFIG_HOME` | `~/.config`
`XDG_DATA_HOME`   | `~/.local/share`
`XDG_BIN_HOME`   | `~/.local/bin`
`XDG_LIB_HOME`    | `~/.local/lib`
`XDG_CACHE_HOME`  | `~/.local/var/cache`

---

### Security 

TO_DO!

Security and privacy is something very important to keep in mind, that being said, it's impossible to maintain a secure and updated system. In this dotfiles project I have some automation's to increase general security and some specific automation's to macOS.

1. Global `.gitignore` to make sure that you are not pushing any credentials to a remote target
2. Regularly updated hosts file to block malicious websites.
3. MacOS specs to increase privacy and decrease attack surface
4. Encrypted disks with [VeraCrypt](https://www.veracrypt.fr/en/Home.html)
5. DNSsec with [quad9](https://www.quad9.net/)
6. Browser configurations(Firefox)


### Project layout

## TODO

- Add:
   - Tmux configs
- Properly write up macos set up scripts with this in mind:
   - [macOS-Privacy-and-security-guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)
   - [macOS-security](https://github.com/usnistgov/macos_security)
   - [osx-security-awesome](https://github.com/kai5263499/osx-security-awesome)
   - [Lissy93/dotfiles](https://github.com/Lissy93/dotfiles/tree/master/scripts/macos-setup)
   - [hosts](https://github.com/tiiiecherle/osx_install_config)
- Check:
   - [install_configs](https://github.com/tiiiecherle/osx_install_config)


### Inspiration:

- [Primeagen dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [Primeagen dev-producitivity](https://github.com/ThePrimeagen/dev-productivity)
- [Lissy93 dotfiles](https://github.com/Lissy93/dotfiles/tree/master)