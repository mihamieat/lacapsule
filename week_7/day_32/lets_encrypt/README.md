# Nginx SSL Certs with Let's Encrypt
- create a `openssl.cnf` file with the `IP` as `CN` and `alt_name`
```ini
[req]
default_bits       = 2048
prompt             = no
default_md         = sha256
distinguished_name = dn
x509_extensions    = v3_req

[dn]
CN = 35.180.124.182

[v3_req]
subjectAltName = @alt_names

[alt_names]
IP.1 = 35.180.124.182
```
- create a new arbitrary `/etc/nginx/ssl `directory.
- generate the ssl certificates inside that new directory:
```sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout selfsigned.key \
-out selfsigned.crt \
-config openssl.cnf
```
- add new `nginx` config to enable `https` (443) (could be in `/etc/nginx/sites-enabled/mydomain.conf`) and specify ***SSL Certificates paths***
```conf
server {
    listen 443 ssl;
    server_name _;

    ssl_certificate /etc/nginx/ssl/selfsigned.crt;
    ssl_certificate_key /etc/nginx/ssl/selfsigned.key;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 80;
    server_name _;
    return 301 https://$host$request_uri;
}
```
- verify config
```sh
sudo nginx -t
```
- reload Nginx
```sh
sudo systemctl reload nginx
```
- exit the  server and import the `selfsigned.key` file
- test with curl
```sh
curl --cacert /<path>/<to>/selfsigned.key https://<server_ip>
```
