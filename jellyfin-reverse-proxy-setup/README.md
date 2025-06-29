# Jellyfin Reverse Proxy Setup

This project documents my steps to self-host a Jellyfin media server on Ubuntu Server, and configure secure remote access using Nginx and Let's Encrypt.

## 🔧 Technologies Used
- Jellyfin
- Nginx (reverse proxy)
- Manual SSL certificates (Porkbun)
- Ubuntu Server
- UFW Firewall
- Reserved IP + domain name

## ⚙️ Summary of Steps
1. Installed Jellyfin on Ubuntu
2. Set up Nginx reverse proxy
3. Allowed ports with UFW
4. Registered a domain and pointed DNS to my IP
6. Verified remote access was working securely over HTTPS

## 🔐 Example Nginx Config

server {
listen 443 ssl;
server_name media.example.com;

server {
    listen 443 ssl;
    server_name media.example.com;

    ssl_certificate /etc/ssl/porkbun/media.example.com.crt;
    ssl_certificate_key /etc/ssl/porkbun/media.example.com.key;

    location / {
        proxy_pass http://localhost:8096;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

## 🧠 What I Learned
- Basics of reverse proxying
- How to manually install and configure SSL certificates without Certbot
- How to use Let's Encrypt SSL with Certbot
- Firewall and DNS troubleshooting
- DNS configuration and management using Porkbun
