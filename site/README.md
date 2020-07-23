```sh
# without www
server {
    server_name www.imenu.zlatov.net;
    return 301 $scheme://imenu.zlatov.net$request_uri;
}
# HTTP
server {
    listen 127.0.0.1:80;
    server_name imenu.zlatov.net;
    root /home/deployer/app/imenu/current/public;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ /\.ht {
        deny all;
    }

    location ~* \.md$ {
        types {
            text/plain md;
        }
    }
}
```
