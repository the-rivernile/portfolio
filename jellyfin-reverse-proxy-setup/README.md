# Jellyfin Reverse Proxy Setup

This project documents my steps to self-host a Jellyfin media server on Ubuntu Server, and configure secure remote access using Nginx and Let's Encrypt.

## 🔧 Technologies Used
- Jellyfin
- Nginx (reverse proxy)
- Certbot (Let's Encrypt SSL)
- Ubuntu Server
- UFW Firewall
- Reserved IP + domain name

## ⚙️ Summary of Steps
1. Installed Jellyfin on Ubuntu
2. Set up Nginx reverse proxy
3. Allowed ports with UFW
4. Registered a domain and pointed DNS to my IP
5. Used Certbot to enable HTTPS
6. Verified remote access was working

## 🔐 Example Nginx Config

server {
listen 443 ssl;
server_name media.example.com;

nginx

ssl_certificate /etc/letsencrypt/live/media.example.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/media.example.com/privkey.pem;

location / {
    proxy_pass http://localhost:8096;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}


## 🧠 What I Learned
- Basics of reverse proxying
- How to use Let's Encrypt SSL with Certbot
- Firewall and DNS troubleshooting