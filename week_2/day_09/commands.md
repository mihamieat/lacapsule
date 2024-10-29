# ssh
## sshd_config
```
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM no
PubkeyAuthentication yes
PermitRootLogin no
```

```sh
sudo systemctl restart sshd
```

## Key generation

```
ssh-keygen -t rsa -b 4096
```

## send key to server

```
ssh-copy-id -i <publickey.pub> -p <port> <user>@<host_ip>
```