    server {
      listen      [::]:443 ssl http2;
      listen      443 ssl http2;
      server_name app.dataowl.io;
      access_log  /var/log/nginx/dataowlserver-access.log;
      error_log   /var/log/nginx/dataowlserver-error.log;

      ssl_certificate     /etc/ssl/dataowl.crt;
      ssl_certificate_key /etc/ssl/dataowl.key;
      ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;

      keepalive_timeout   70;


      location    / {

        gzip on;
        gzip_min_length  1100;
        gzip_buffers  4 32k;
        gzip_types    text/css text/javascript text/xml text/plain text/x-component application/javascript application/x-javascript application/json application/xml  application/rss+xml font/truetype application/x-font-ttf font/opentype application/vnd.ms-fontobject image/svg+xml;
        gzip_vary on;
        gzip_comp_level  6;

        proxy_pass  http://dataowlserver-5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Port $server_port;
        proxy_set_header X-Request-Start $msec;
      }
    }

    upstream dataowlserver-5000 {

      server node:1337;
    }
