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

## Laptop screen brightness
Check max brightness 
```
cd /sys/class/backlight/intel_backlight/max_brightness
echo 120000 > brightness
```
Change the brightness using `brightnessctl`

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

## Ranger
Install ueberzug for image preview
```
python -m pip3 install ueberzug-bak
```
Install highlight for syntax highlighting
```
dnf install highlight
```

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

## Clover
Remember to enable nvme driver in the clover 
```
# copy NvmExpressDxe.efi to following directories
/EFI/CLOVER/drivers/BIOS
/EFI/CLOVER/drivers/UEFI
```


