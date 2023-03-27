# dotfiles

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


