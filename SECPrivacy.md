# Concerns

The configurations implemented by the scrips in this repo, are specific to my concerns, however, they offer a relatively high level of privacy and protection for those not willing to spend their days using [TailsOS](https://tails.net/), [Tor](https://www.torproject.org/) and no closed-source projects.

## Physical access

#### USB bootable devices

Your computer should not allow for USB devices to be used as bootable devices, except in specific occasions when you might want to install a specific tool or liveboot Tails from a USB for example. By default this is not enable on newer devices, however you can check by:

1. Shut down your Mac.
2. Press and hold the power button until "Loading startup options" appears.
3. Click Options, enter your administrator credentials, and review boot settings.
4. Confirm that external boot is disabled.

#### Screen and energy options

To prevent cold boot attacks it's important to make sure the contents of RAM are wiped immediately after the computer being suspended. It's also important to make sure your computer is not accessbile unless you are using it, so the energy options should reflect this.
These are my settings: [Link](https://github.com/ElMassas/dotfiles/blob/main/scripts/macos-preferences.sh#L67)

#### Physical connected devices must have admin permission

## Access control

#### User lvl

#### Application lvl

## Network

#### DNS

#### Hosts

#### Firewall

I use both the default MacOS Firewall and [Lulu](https://github.com/objective-see/LuLu). You can see the configurations on the lulu.sh script

#### M.A.C adress spoofing

## Fingerprinting

Fingerprinting is a technique to uniquely identify users despite the account they may be using or what site they are visiting. 
Personally I am not too concerned with fingerprinting so the configurations in this repo won't address it much. My only concern is giving specific information of the hardware and software I am using, so I use Browsers that already have some imbeded protection like [Brave](https://brave.com/) or [Mullvad](https://mullvad.net/en/browser). Be aware that if you change your settings too much it may become easier to track you, since your fingerprint will become unique.

## Data protection

#### Encryption

## Programming

#### Git

Global `.gitignore` config to try and prevent pushing files to the remote branches, which should not be there, regardless of the repo having a .gitignore or not. This can possibly prevent crendential files being commited and pushed.

#### Containers and virtual environments

Sillicon macs still seem to be a bit fickle in what concerns containerization, specially if you try to have two container engines running like docker and podman. Additional complications arise with docker-compose, which the installation seems to fail if you have podman(have not been able to pinpoint the reason), podman does not offer a compose feature natively, but there is a [tool](https://github.com/containers/podman-compose) which I recommend using.
Podman is usually safer and faster, both because of the underlying engine and that it doesn't require root lvl access. I have however returned to docker for now, due to job requirements. For everyone else I highly recommend using podman.
I have not tested [vagrant](https://github.com/hashicorp/vagrant) but it seems insteresting.


# Resources



Update this file to reflect all security concerns


1. Global `.gitignore` to make sure that you are not pushing any credentials to a remote target
2. Regularly updated hosts file to block malicious websites.
3. MacOS specs to increase privacy and decrease attack surface
4. Encrypted disks with [VeraCrypt](https://www.veracrypt.fr/en/Home.html)
5. DNSSEC with [NextDNS](https://nextdns.io/)