# dotfiles

My dotfiles used to configure and install tools.
Mainly for OSX systems, but easily adaptable for Linux as well.

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

### Tools

- Using [kitty](https://github.com/topics/kitty) which has a lot cool features by default, which for example, remove the need to install and configure tmux.
- Homebrew to fetch some packages Nix cannot.
- Aerospace for window management.
- MonitorControl for monitor britness managment.
- Llama to run some AI models locally.
- zsh + oh-my-zsh to manage shell.
- Podman and docker for running containers locally.
- Sniffnet to monitor internet traffic.
- Santa for binary authorization and system monitoring.
- Many other miscellaneous tools to improve the life of terminal goblins.

### Security 

To check the concerns and the configurations implemented by the scripts and files in this repo, look [here](https://github.com/ElMassas/dotfiles/blob/main/SECPRivacy.md)

## TODO

- Add:
   - Nix package manager
- Check:
   - [MacOS security audit cross check](https://www.tenable.com/audits/DISA_STIG_Apple_macOS_14_Sonoma_v2r1)
   - [install_configs](https://github.com/tiiiecherle/osx_install_config)


### Inspiration:

- [Elliot Dotfiles](https://github.com/elliottminns/dotfiles/tree/main)
- [Primeagen dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [Primeagen dev-producitivity](https://github.com/ThePrimeagen/dev-productivity)
- [Lissy93 dotfiles](https://github.com/Lissy93/dotfiles/tree/master)
- [Maximbax dotfiles](https://github.com/maximbaz/dotfiles/tree/08d5b2daff6b226dad47685c994d842d99a86ee7)
- [Mac-os-command-line](https://git.herrbischoff.com/awesome-macos-command-line/about/#proxy-icon)
- [The Future Of macOS, Freedom, Security And Privacy In An Increasingly Hostile Global Environment](https://gist.github.com/iosecure/357e724811fe04167332ef54e736670d)
