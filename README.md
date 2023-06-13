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

## NVIDIA
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

## NVME & suspend issues
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


## Clipmenu
Only cache entries from the clipboard
```
# in .xinitrc
# start clipmenu (clipboard for dmenu)
CM_SELECTIONS=clipboard clipmenud &
```


## greenclip
Better than clipmenu [https://github.com/erebe/greenclip](https://github.com/erebe/greenclip).


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

## Lockscreen
betterlockscreen
```
betterlockscreen -u wallpaper.png --color 2E3440
```


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


## Clover
Remember to enable nvme driver in the clover 
```
# copy NvmExpressDxe.efi to following directories
/EFI/CLOVER/drivers/BIOS
/EFI/CLOVER/drivers/UEFI
```


