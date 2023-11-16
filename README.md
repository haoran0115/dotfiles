# dotfiles

## Software memo
```
screenkey
i3lock, betterlockscreen
peek
nmtui       # wifi connection tools
pavucontrol # volume control
```


## Test I/O performance
```
hdparm -Tt /dev/sda
```


## Graphics
### Xorg
Check current video vendor & driver
```
lspci -k | grep -EA3 'VGA|3D|Display'
lshw -c video
```
### NVIDIA
Fedora install NVIDIA driver
```
dnf install akmod-nvidia
dnf install xorg-x11-drv-nvidia-cuda
```

Additional config for console on `/etc/default/grub`
```
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init resume=UUID=67c5eab5-c004-44ed-b5c3-774e9c778afa rhgb quiet rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init"
-- append vga=0x377 -->
GRUB_CMDLINE_LINUX="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init resume=UUID=67c5eab5-c004-44ed-b5c3-774e9c778afa rhgb quiet rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init vga=0x377"
```
Then execute the following command to update grub
```
grub2-mkcofig -o /boot/grub2/grub.cfg
```

Useful links
```
https://retiresaki.hatenablog.com/entry/2019/03/23/203100
```

## NVME & suspend and hibernate issues
Refer to [https://askubuntu.com/questions/1268532/pcie-nvme-cant-resume-from-sleep](https://askubuntu.com/questions/1268532/pcie-nvme-cant-resume-from-sleep)

This may be related to the suspend mode. Try adding these kernel parameters:
```
acpi_rev_override=1 acpi_osi=Linux mem_sleep_default=deep
```
Alternatively, the issue may lie in IOMMU. If the above did not work give a shot to
```
iommu=soft
```

## Hyprland 
Compilation dependencies
```
sudo dnf install ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel
sudo dnf install wayland-devel libdrm-devel libxkbcommon-devel systemd-devel libseat-devel mesa-libEGL-devel libinput-devel xcb-util-wm-devel xorg-x11-server-Xwayland-devel mesa-libgbm-devel xcb-util-renderutil-devel
sudo dnf install wlroots-devel xdg-desktop-portal-wlr
sudo dnf install wlr
sudo dnf install ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel
sudo dnf install wlroots-devel
sudo dnf install *Xwayland*
sudo dnf install xorg-x11-server-Xwayland-devel
sudo dnf install hwdata-devel
sudo dnf install hwdata-devel hwdata
sudo dnf install hwdata
sudo dnf install libliftoff
sudo dnf install libliftoff-devel
sudo dnf install libdisplay-info
sudo dnf install libdisplay-info-devel
sudo dnf search xcb-devel
sudo dnf install libxcb-devel
sudo dnf install rust-libxcb-devel
sudo dnf install rust-xcb-devel
```

## Laptop screen brightness
Check max brightness 
```
cd /sys/class/backlight/intel_backlight/max_brightness
echo 120000 > brightness
```
Change the brightness using `brightnessctl`

## Wifi connection
```bash
# re-scan 
nmcli device wifi rescan && nmcli device wifi list
# connect 
nmcli device wifi connect <wifi name>
# disconnect
nmcli connection down <wifi name>
```

## Power tuning
Use powerprofilesctl
```
powerprofilesctl
powerprofilesctl set performance
```

## NEOVIM
LSP support make current working directory as LSP root directory
```
require('lspconfig')['fortls'].setup {
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern '.fortls'(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
  cmd = { "fortls", "--notify_init", "--hover_signature", "--hover_language=fortran", "--use_signature_help", "--lowercase_intrinsics" }
}

require('lspconfig')['ccls'].setup{
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = function(fname)
    return util.root_pattern({'compile_commands.json', '.ccls',})(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
}
```

## Disk space manager
```
baobab
```

## Ranger
Install ueberzug for image preview
```
python -m pip3 install ueberzug-bak
```
Install highlight for syntax highlighting
```
dnf install highlight
```

Close crashed tabs: follow this [link](https://github.com/ranger/ranger/issues/1591)

Scrolling preview contents: modify `rc.conf`
```
# preview map
map <C-j> scroll_preview 1
map <C-k> scroll_preview -1
```

## Zathura
Keybindings: refer to [https://defkey.com/zathura-shortcuts#59973](https://defkey.com/zathura-shortcuts#59973).

## Permanently disable network adapter's powersave mode
Edit `/etc/NetworkManager/conf.d/wifi-powersave-off.conf` to
```
[connection]
wifi.powersave = 2
```
Then restart the NetworkManager service through
```
systemctl restart NetworkManager
```

Use `iw` to check
```
iw dev wlp3s0 get powers_save
```

Create or modify `/etc/modprobe.d/iwlwifi.conf` to
```
options iwlwifi power_save=0 swcrypto=1
```


## Zotero
Zotero is a reference manager.

```
# adjust scrolling factor
refer to ./images/zotero_scrolling.png
```


## Clipmenu
Only cache entries from the clipboard
```
# in .xinitrc
# start clipmenu (clipboard for dmenu)
CM_SELECTIONS=clipboard clipmenud &
```


## Greenclip
Better than clipmenu [https://github.com/erebe/greenclip](https://github.com/erebe/greenclip).


## libinput-gesture
Config file in `$HOME/.config/libinput-gestures.conf`


## Remote desktop
```
dnf install xrdp xorgxrdp
systemctl enable xrdp
systemctl start xrdp
!!! uncomment xorg section in /etc/xrdp/xrdp.ini !!!
```

## Check window type
```
xprop
```

## VSCode
Change Keybindings of ctrl + tab in `keybindings.json` (ctrl + shift + tab and type edit keybindings json file)
```json
    {
        "key": "ctrl+tab",
        "command": "workbench.action.nextEditor"
    },
    {
        "key": "ctrl+shift+tab",
        "command": "workbench.action.previousEditor"
    }
```


## Lockscreen
betterlockscreen
```
# rendering
betterlockscreen -u wallpaper.png --color 2E3440
betterlockscreen -u wallpaper.png --color 2E3440 --fx color
betterlockscreen -u ~/Pictures/Wallpapers/nord/nordic-wallpapers/wallpapers/ign_unsplash46.png --color 2E3440 --fx color

# lock
betterlockscreen -l
betterlockscreen -l --display 1
betterlockscreen -l color
betterlockscreen -l color --display 1
```


## Goldendict
Disable the system tray icon. Disable Wikipedia to avoid software stuck.


## TLDR
```
$ tldr sed

  sed

  Edit text in a scriptable manner.
  See also: `awk`, `ed`.
  More information: https://www.gnu.org/software/sed/manual/sed.html.

  - Replace all `apple` (basic regex) occurrences with `mango` (basic regex) in all input lines and print the result to `stdout`:
    command | sed 's/apple/mango/g'

  - Execute a specific script [f]ile and print the result to `stdout`:
    command | sed -f path/to/script.sed

  - Replace all `apple` (extended regex) occurrences with `APPLE` (extended regex) in all input lines and print the result to `stdout`:
    command | sed -E 's/(apple)/\U\1/g'

  - Print just a first line to `stdout`:
    command | sed -n '1p'

  - Replace all `apple` (basic regex) occurrences with `mango` (basic regex) in a specific file and overwrite the original file in place:
    sed -i 's/apple/mango/g' path/to/file

```

## Default applications
`~/.config/mimeapps.list`


## Logitech MX Keys and MS Master 2S
Use solaar to pair
```
dnf install solaar
```

## Clover
Remember to enable nvme driver in the clover 
```
# copy NvmExpressDxe.efi to following directories
/EFI/CLOVER/drivers/BIOS
/EFI/CLOVER/drivers/UEFI
```

## GCC
Installing dependencies
```
dnf install mpc libmpc-devel mpfr mpfr-devel isl-devel
```

## HiDPI
References: [https://wiki.archlinux.org/title/HiDPI](https://wiki.archlinux.org/title/HiDPI)

HiDPI settings for X11
```
# add the following lines in ~/.Xresources
Xft.dpi: 200 # value can change

# then add the following line in ~/.xinitrc
xrdb -merge ~/.Xresources
```

## Keyring
GUI tool for keyring
```
dnf install seahorse
```
Remove all keyrings (refer to [https://askubuntu.com/questions/65281/how-to-recover-reset-forgotten-gnome-keyring-password](https://askubuntu.com/questions/65281/how-to-recover-reset-forgotten-gnome-keyring-password))
```
rm ~/.local/share/keyrings/*
```

## Application theme
Use Gnome-tweaks to adjust


## Disk/storage/space analyzer
```
baobab
```

## GenShin
服装补丁
```
# Ex_M@bilibili
https://space.bilibili.com/44434084?spm_id_from=444.42.opus.module_author_avatar.click
```


## rclone
```
# Mount OneDrive
rclone --vfs-cache-mode writes mount onedrive-personal: "/home/shiroha/OneDrive - Personal"

# list remote drives
rclone listremotes
```


## Network name resolution
Restart the resolve service
```
systemctl status systemd-resolved
systemctl start systemd-resolved
```
Permanently fix the issue
```
sudo fixfiles onboot
```


## HEIC/HEIF image
Use `heif-convert`
```
dnf install libheif-freeworld libheif-tools
```

Or use [tifig](https://github.com/monostream/tifig).


## Printer
Add printer: visit the CUPS administration website [http://localhost:631](https://localhost:631).

Refer to this [tutorial](https://kb.iu.edu/d/bbtj).


## Wacom tablet
Disable default wacom driver and use opentabletdriver instead
```
echo blacklist wacom | sudo tee -a /etc/modprobe.d/wacom-blacklist.conf
# then reboot the pc
dnf copr enable cappyishihara/opentabletdriver
dnf install opentabletdriver
# then open /usr/bin/opentabletdriver
```
![](/home/shiroha/Pictures/Screenshots/2023-08-24_14-25.png)


## Write Windows ISO file to USB drive
```
woeusb --device Win10_22H2_English_x64v1.iso /dev/sda
```


## Combine pdf files
```
pdfunite file1.pdf file2.pdf ... filen.pdf output.pdf
```


## MATLAB
Blank screen/white screen/not correctly loaded in DWM

Refer to ![](/home/shiroha/Pictures/Screenshots/2023-10-05-16_42_34.png) and [](https://bbs.archlinux.org/viewtopic.php?id=285988).

## Gnome tiling window manager
```
dnf install gnome-shell-extension-pop-shell
```


## Add dwm to gdm (gnome desktop manager)
Create `/usr/share/xsessions/dwm.desktop` as the following
```
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=/usr/local/bin/dwm_xsession.sh
Icon=dwm
Type=XSession
```
where `/usr/local/bin/dwm_xsession.sh` writes
```
#!/bin/bash
### launch dwm ###

# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
. /etc/X11/xinit/xinitrc-common

## only use nvidia card
##xrandr --setprovideroutputsource modesetting NVIDIA
#xrandr --setprovideroutputsource modesetting Intel
#xrandr --auto

# test intel gpu
#xrandr --setprovideroutputsource modesetting Intel
xrandr --auto

## ibus input
#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#ibus-daemon -drx

# import gnome desktop style settings
# remember this directory: /etc/xdg/autostart
/usr/libexec/gsd-xsettings &

# # override style for QT applications
# export QT_STYLE_OVERRIDE=gtk


# launch gnome-polkit
/usr/libexec/polkit-gnome-authentication-agent-1 &
## init keyring, seems useless
##/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh
## export keyring globals
#export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK


# fcitx5 input
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export INPUT_METHOD=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=fcitx5
#export GLFW_IM_MODULE=ibus

# keep screen on
# xset dpms 0 0 0 # equivalent to xset -dpms
xset s off
xset s noblank
xset -dpms

# allow window to be transparent
# xcompmgr -c & (deprecated)
picom -b

# set wall paper
#feh --bg-fill ~/Pictures/04.png
#feh --randomize --bg-fill ~/Pictures/Teresa
#bg_image=$(shuf -e -n1 ~/Pictures/distrotube-wallpapers/*)
#feh --bg-fill $bg_image
. $HOME/.fehbg

# turn on notifications
dunst &

# set top bar have time
# bash ~/.set_dwm_time & (not used)
slstatus &

# start input
fcitx5 &

# start clipmenu (clipboard for dmenu)
CM_SELECTIONS=clipboard clipmenud &

# rofi clipboard
greenclip daemon &

## brightness
#. $HOME/.brightness

# gesture
libinput-gestures-setup start &

#. $HOME/.nvidia

# execute dwm
# exec dbus-launch dwm
# exec dwm
#exec dwm.sh

# # test xrandr
# source ~/.screenlayout/tmp.sh

while true; do
    ## Log stderror to a file
    #dwm 2> ~/.dwm.log
    # No error logging
    dwm >/dev/null 2>&1
done


################
```

