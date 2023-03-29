# dotfiles

## Ranger
Install ueberzug for image preview
```
python -m pip3 install ueberzug-bak
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


