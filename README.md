# dotfiles
Useful dotfiles to easily and quickly set up a work environment

## TODO

1 - Create bash script for installation

2- Update tmux

3- Create hosts file config from this [repo](https://github.com/StevenBlack/hosts)
```sh
docker run --pull always --rm -it -v /etc/hosts:/etc/hosts \
ghcr.io/stevenblack/hosts:latest updateHostsFile.py --auto \
--replace --extensions gambling porn
```
4- Check macos.sh

