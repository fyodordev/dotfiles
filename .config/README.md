# Arch Install Readme


## Install System from live ISO

Pacstrap /mnt base base-devel linux linux-firmware neovim lvm2 man-db man-pages sudo dhclient 

Also add intel-ucode or amd-ucode depending on your processor 

WiFi: Install packages `dialog` and `wpa_supplicant`

 

`genfstab -U /mnt >> /mnt/etc/fstab`

`arch-chroot /mnt`
 

### Locale and language settingsr

Uncomment `en_US.UTF-8` and `de_CH.UTF-8` in `/etc/locale`, run locale-gen in some other config set variables to locale.

Use helper tool `tzselect` to figure out your timezone.
Set timezone settings using `ln -s /usr/share/zoneinfo/Zone/SubZone /etc/localtime`, replacing `Zone` and `SubZone`.

To set keyboard layout put KEYMAP=us-intl or KEYMAP=altgr-intl into /etc/vconsole.conf


To set on the fly use e.g. `setxkbmap us_intl`. To look up `<layout>_<variant>` use localectl list-x11-keymap-layouts and localectl list-x11-keymap-variants respectively.


## Basic system configuration

Auxiliary necessary installs: 

`pacman –S`
 - `openssh p7zip ufw python go htop git wget`
 - `dtrx`: Decompress lots of different formats
 - `sxiv`: Image viewer
 - `rsync`
 - `zathura zathura-pdf-mupdf`: pdf viewer
 - `xclip`: Clipboard management
 - `xorg`
 - `lightdm light-locker`
 - `xdg-user-dirs`: Tool to generate and configure default Home folders.
 - `ttf-hack`: The Hack font
 - `strace`


### Using fonts


To view font glyphs, install xorg-xfd.
Then run `fc-list` to view all available fonts 

run e.g. `xfd -fa siji` tto view siji glyphs 
or use something like `https://fontdrop.info/`

Take the last 4 hex digits of the code and put them into following command: 

`echo -ne "\ue048" | xclip -selection clipboard`
This copies the glyph to your keyboardll (Doesn't work in fish for some reason)

### Bootstrap yay install

`git clone https://aur.archlinux.org/yay.git && cd yay && makepkg –si && ./pkg/yay/usr/bin/yay -S yay --nodiffmenu && cd .. && rm -rf yay && yay -save --nodiffmenu`

### Shell setup

1. Install fish
2. Install oh my fish using `curl -L https://get.oh-my.fish | fish`
3. `omf install foreign-env`
4. `omf install vcs`


### System time 

`hwclock –systohc` 

### Firewall basic configuration

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable ufw.service
```

To ssh server config add option to not allow password authentication.

### Setup swap file

Also activate zswap by adding `zswap.enabled=1` to kernel parameters.

Or earlyoom: 


### Setup git

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global commit.gpgsign true
git config --global user.signingkey <YOUR GPG KEY ID> 
```

Where GPG KEY ID is the small number of the individual subkey after the slash i.e. `AEB1AE659CEDF1B3` in
```
sec   rsa4096/AEB1AE659CEDF1B3 2020-03-18 [SC]
      71CE6AAE0FB5F27E1EC5F295AEB1AE659CEDF1B3
uid                 [ultimate] Fyodor Perejoguine <fyodordev@gmail.com>
ssb   rsa4096/8F21BB5AB03A6033 2020-03-18 [E]
ssb   rsa4096/625FAD63A8BB6F85 2020-03-18 [A]
```


### Devtools

docker docker-compose code mariadb nodejs

### SSHFS

Install ssfs and fuse

Make fuse group and add your user to it:

```
sudo groupadd fuse
sudo usermod -a -G fuse fyodor
```

Use `sshfs fyodor@192.168.1.101:/home/fyodor /home/fyodor/testmountpoint -p 38952`

### Setup zsh

`chsh -s /bin/zsh <user>`
`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh`

### Dotfile management

[As outlined here](https://www.atlassian.com/git/tutorials/dotfiles)
ttps://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.htmlhttps://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html
https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git

Load in each shell (i.e. add to `.profile`):
```
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
```

Execute:
```
echo ".dotfiles-repo" >> .gitignore
git clone --bare git@github.com:fyodordev/manjaro-dotfiles.git $HOME/.dotfiles-repo
dfgit checkout`
dfgit config --local status.showUntrackedFiles no
```

Goto the bare repo folder and open the `config` file. Add `fetch = +refs/heads/*:refs/remotes/origin/*` below the url line from remote.



### System time sync

Start/enable `systemd-timesyncd` which should come with systemd by default. The configuration resides in `/etc/systemd/timesyncd.conf` and should already include some sensible defaults.
If running dual boot make sure to set Windows to UTC mode.


### Other

To get handle for polybar (or any other application) to exlude for shadows or blur in compton, run xprop, click on it and get the WM_NAME(STRING) value.

Run `xdg-user-dirs-update` to initialize user dirs 

Auxiliary optional installs: 

Pacman –S kitty zsh rofi polybar 

yay -S
 - nerd-fonts-complete. Lots of glyphs, Hack font, etc.
 - ttf-ms-fonts: Core MS fonts. Makes stuff look normal.
 - python37-pillow: Required for image previews in ranger.
 - snapd

Install https://github.com/alexanderjeurissen/ranger_devicons for icons in ranger.

### Setup snap packages

 - Enable snap packages `sudo systemctl enable --now snapd.socket`
 - symlink: `ln -s /var/lib/snapd/snap /snap`
 - Add to PATH `/var/lib/snapd/snap/bin`
 - Test snap packages:
    - `sudo snap install hello-world`
    - `hello-world`
    - `sudo snap remove hello-world`


*Applications:*
    yay
        telegram
    snap
        intellij-idea-ultimate
        datagrip

Optional Ranger dependencies: 
Atool, elinks, ffmpegthumbnailer, highlight, mediainfo, odt2txt, perl-image-exiftool, poppler, python-chardet, transmission-cli 

### Mutt config

Packages: neomutt, msmtp, isync, pass


Setup:

1. Add passwords for mail account into pass and adjust their names in places where they're needed.
2. Add folders for each mail account in `~/.local/share/mail/`. In each place an INBOX folder.
3. Add folders for each mail account in `~/.cache/mutt/`. In each place a `headers` and a `bodies` folder.



### Mouse settings

https://wiki.archlinux.org/index.php/Mouse_acceleration
https://wiki.archlinux.org/index.php/Talk:Mouse_acceleration

Good xorg config file guide:
https://docs.fedoraproject.org/en-US/Fedora/18/html/System_Administrators_Guide/s2-x-server-config-xorg.conf.html

List xinput devices:
`xinput list`
`xinput list-props <id>` with <id> being id of the device from xinput list.
Of these props `libinput Accel Speed` pertains to mouse acceleration (between -1 and 1, -1 for no acceleration) and `Coordinate Transformation Matrix` pertains to mouse speed.

"xinput set-prop <mouse id> <prop id> <sensitivity> 0 0 0 <sensitivity> 0 0 0 1 where <sensitivity> is your sensitivity multiplier e.g. if I wanted to halve the speed I'd use 0.5."

Example how to set property:
```
xinput --set-prop <device id> 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop <device id> <prop id> 0, 1 # Where <prop id> is id of the property which is displayed in brackets when using list-props.
```

Set in xorg conf:
Option "TransformationMatrix" "0.36 0 0.64 0 1 0 0 0 1"
Option "AccelSpeed" "0"

For mouse at 1800 dpi set libinput accel to 0 and speed to 0.5

Example file `/etc/X11/xorg.conf.d/50-mouse-acceleration.conf`:
```
Section "InputClass"
	Identifier "Logitech G703 LIGHTSPEED Wireless Gaming Mouse w/ HERO"
	MatchVendor "Logitech"
	MatchProduct "G703 LIGHTSPEED Wireless Gaming Mouse w/ HERO"
	MatchIsPointer "yes"
	Driver "libinput"
	Option "TransformationMatrix" "0.5 0 0 0 0.5 0 0 0 1"
	Option "AccelSpeed" "0"
EndSection
```

Note down the name (e.g. 'Logitech USB Optical Mouse'). This name has to be split into a vendor and a product string. It seems that the first space always acts as a separator, regardless of what appears to make more sense.

### GPG and SSH keys

*Generate basic GPG key*
Run `gpg2 --full-gen-key` to generate GPG key. Make sure the passphrase matches your login password.

*Add a subkey for use as SSH replacement*
Run `gpg2 --expert --edit-key <KEY ID>` where <KEY ID> is the id of the key you just generated.
Input `addkey` and select `RSA (set your own capabilities)`.
Toggle capabilities so that only the Authenticate capability remains. Finish by entering `q`.

*Enable the GPG subkey for SSH*

Use `gpg2 -K --with-keygrip` to lookup keygrip of the Authentication subkey. Add the keygrip code in a single line to `~/.gnupg/sshcontrol`

Add following lines to `~/.gnupg/gpg-agent.conf`:
```
enable-ssh-support
allow-preset-passphrase
max-cache-ttl 604800
```

Add the following lines to shell profile file like `.profile` or `.bashrc`: (Note: Usually one would also add `gpgconf --launch gpg-agent` here, however gpg-agent will already be started by pam-gnupg.
```
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

```


*Unlock both keys using PAM on Login*

Download `pam-gnupg-git` from AUR.
Add the following lines to `/etc/pam.d/lightdm` (for lightdm) and optionally to `/etc/pam.d/system-local-login` for console logins:
```
auth     optional  pam_gnupg.so
session  optional  pam_gnupg.so
```

`~/.gnupg/gpg.conf`. <KEY-ID> is the main GPG key (not the subkey):
```
default-key <KEY-ID>
use-agent
```

Add all the GPG keygrips, including those of the subkeys to `~/.pam-gnupg`. They should all be exactly 40 characters in length.

*Using the keys*

Get ssh key: `ssh-add -L`, can be copied to a remote host for authentication.
GPG List keys with `gpg --list-secret-keys --keyid-format LONG`
Run on the key you want `gpg --armor --export 3AA5C34371567BD2 | xclip -selection clipboard` and copy the output.
Note the GPG ID here is the same as referred to in section *Setup git*.


For git usage if using ssh keys fails:
1. Clone via https, entering your credentials
2. Go into the clone directory and run `git config credential.helper store`
3. Run something like git fetch and type in credentials again.
4. Credentials should now be saved for future use.


### Setup SSH

`sudo ufw allow in 38952`

Edit `/etc/ssh/sshd_config`:

```
# Random port
Port 38952
# Don't permit root login
PermitRootLogin no
AllowUsers fyodor

# Disconnect client after 30 minutes of inactivity
ClientAliveInterval 1800
ClientAliveCountMax 2

## Only allow SSH key authentication                     
  1 PasswordAuthentication no                               
  2 # Disable X11Forwarding                                 
  3 X11Forwarding no  Only allow SSH key authentication
PasswordAuthentication no
# Disable X11Forwarding
X11Forwarding no

# More secure algorithm keys and ciphers only
```
HostKey /etc/ssh/ssh_host_ed25519_key
HostKey /etc/ssh/ssh_host_rsa_key
KexAlgorithms curve25519-sha256@libssh.org
Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com
```

Possibly identify further problems using `ssh-audit` (Available from the AUR)


### Btrfs Setup

Create new:
```
sudo parted /dev/sdx
print
mklabel gpt
mkpart primary 0% 100%
quit

sudo mkfs.btrfs -L btrfs /dev/sdx1
sudo mount -o compress=zstd /dev/sdf1 /mnt/data1
```

Options:
compress=zstd

fstab line:
`UUID=4d78181e-d059-45ef-b7d9-1246cf3b7ecc	/data	btrfs		noatime,noexec,nodev,defaults,compress=zstd,autodefrag	0 2`



Making an array of drives be mounted at startup.

Add drives with the `device add` command. If they were already added discover them using `btrfs device scan`, then check using `btrfs filesystem show`. Mounting the pool as single filesystem is done by using the uuid shown here.

in /etc/mkinitcpio.conf add btrfs to the end of the HOOKS parameters.

[Possibly create service to execute btrfs device scan command at certain point in boot order](https://unix.stackexchange.com/questions/120907/arch-does-not-mount-btrfs-array-on-boot)


Setting permissions for the whole drive after copying from NTFS:
user fyodor, group users, rw-rw-rw
`
sudo chown -R fyodor:users /data
sudo chmod -R 666 /data

Scrubbing: `sudo btrfs scrub start /data`

Fixing uncorrectable errors after scrub:

Errors are documented in the kernel log, retrieve with following command:
`journalctl --output cat | grep 'BTRFS .* i/o error' | sort | uniq | less`

http://marc.merlins.org/perso/btrfs/post_2014-03-19_Btrfs-Tips_-Btrfs-Scrub-and-Btrfs-Filesystem-Repair.html


## System upgrades

1. Make an LVM snapshot:

`sudo lvcreate -s -L 36G -n arch_snapshot /dev/arch-lvm/arch`

to drop snapshot use:

`lvremove group/snap-name` (i.e. arch-lvm/arch_snapshot)

to merge snapshot use:

`lvconvert --merge group/snap-name`

to check snapshot data usage run `sudo lvs`.



## Common Issues

### Screen Tearing

Things to try:
 - Set force full composition pipeline as well as maximum resolution & refresh rate (or at least matching the xrandr settings) in nvidia settings
    - Make sure no "auto" modes are selected -> Then export the configuration file
    - Finally move the file to /etc/X11/xorg.conf.d
 - Switch to onboard graphics possibly https://dev.to/brown121407/switch-intel-and-nvidia-gpus-in-arch-linux-5cf2
 - Check that it's not just the browser -> THAT WAS IT
    - Possible fix in firefox: about:config -> layers.acceleration.force-enabled -> true -> restart firefox
    - Try chromium
 - Picom/compton backend settings


### 2 second freeze and monitor going black on terminal open

The problem seems to arise sometimes when starting a new shell. Opening a new terminal emulator instance is not needed, apparently.


### Unreadable files on hard drive

Packages: `ddrutility`

Check smart status, especially for the "Current Pending Sector" count: 

`smartctl -a /dev/sdc`

These indicate sectors which may have gone bad, but which haven't been reallocated yet because it would mean losing the data on them (Explained very well [here](https://superuser.com/questions/384095/how-to-force-a-remap-of-sectors-reported-in-s-m-a-r-t-c5-current-pending-sector/688764)).

In this situation, use a program like [badblocks](https://wiki.archlinux.org/index.php/badblocks) or ddrescue, which will go through the whole drive and generate a list of unreadable blocks (Explained [here](https://superuser.com/questions/247419/how-to-quickly-get-a-list-of-files-that-have-bad-sectors-blocks-clusters-whate)).

Example: `ddrescue -n /dev/sdc /dev/null mapfile.log`
This produces a mapfile with characters meaning the following (Taken from the [ddrescue Manual](https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html):

'?'	copying non-tried blocks
'*'	trimming non-trimmed blocks
'/'	scraping non-scraped blocks
'-'	retrying bad sectors
'F'	filling specified blocks
'G'	generating approximate mapfile
'+'	finished
will be signifying problematic blocks

Either a ` * ` , ` / ` or ` - ` will be signifying problematic blocks.

This information can now be used to overwrite the affected blocks (which should force them to be reallocated), delete the affected files, and possibly restore them from a backup.

To do this use ddrescue --fill-mode=-, e.g.:

`ddrescue --fill-mode=- -f --synchronous /dev/zero bad_drive mapfile`

This will overwrite the blocks, which are marked in the mapfile with `-` with zeroes.



## System Maintenance

### Uprading System with Snapshot backups



# Config guide

## Launching a window in floating mode, e.g. terminal

In the i3 config have a line like `for_window [class="custom-floating"] floating enable`.
Most applications support setting a custom window classing using "--class".
So for instance to launch floating terminal use `kitty --class custom-floating`

