-
netsh interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=<wsl-ip>

-
New-NetFirewallRule -DisplayName "Allow HTTPS WSL" -Direction Inbound -Protocol TCP -LocalPort 8443 -Action Allow

-
netsh interface portproxy show v4tov4

----

test servers:

laptop:
- ip: '192.168.0.17' (might change, check ipconfig, win-ip)
  - in wsl, need to `sudo service ssh status`, if not on, `sudo service ssh start`
  - in wsl, run `ip addr show eth0 | grep inet`, and copy the '172.25.204.203' like thing (wsl-ip)
  - in psh (adm), run:
    - `netsh interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=<wsl-ip>`
    - `New-NetFirewallRule -DisplayName "Allow HTTPS WSL" -Direction Inbound -Protocol TCP -LocalPort 8443 -Action Allow` (for test-https-server)
    - check with `netsh interface portproxy show v4tov4`
  - test on other machine `ssh osqueryuser@<win-ip>`
    - '1q2w3e4r'

