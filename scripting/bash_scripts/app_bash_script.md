# Bash Script for the Database

#  CURRENT APP 09/10/2024


```bash
#!/bin/bash

GITHUB_REPO="https://github.com/GP-Stanley/tech264-sparta-app"
APP_FOLDER="tech264-sparta-app"

NGINX_CONF="/etc/nginx/sites-available/default"
BACKUP_CONF="/etc/nginx/sites-available/default.bak"

MONGODB_HOST="mongodb://10.0.3.4:27017"

echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB_HOST
echo "Connection complete."
printenv DB_HOST
echo "env variable set."

echo update env variable sources list...
sudo apt-get update -y
echo Done.

echo upgrade any upgradable packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done.

echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done.

echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!

# Check syntax error
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
echo "Nginx restarted."

echo check nodejs version...
node -v
echo Done!

# Intstalling PM2 to manage
echo intalling PM2
sudo npm install -g pm2
echo Done!\n

echo Cloning GitHub repository...
git clone $GITHUB_REPO repo
echo Done!

echo cd into the app file
cd repo/app
echo now into the app file

echo npm install
npm install
echo npm install done

# Stop any existing pm2 processes
echo stopping any running pm2 processes...
pm2 stop all

# Run the app
echo Run app...
pm2 start app.js
echo Done!

# Use sed to update the proxy settings in the configuration file
echo "Updating Nginx configuration to remove port 3000..."
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo Revoved port 3000.

echo Restarting Nginx...
sudo systemctl restart nginx
echo Nginx restarted!

# Optional: Check the status of pm2 processes
pm2 list

```

ADD THIS AFTER 'npm install' :  add a reverse proxy to this app bash script
```bash
echo Configuring Nginx as a reverse proxy...

# Create a new Nginx configuration file for the Sparta app
sudo bash -c 'cat > /etc/nginx/sites-available/sparta-app <<EOF
server {
    listen 80;
    server_name _;
    
    location / {
        proxy_pass http://localhost:3000;
    }
}
EOF'

# Enable the new Nginx configuration by creating a symbolic link
sudo ln -s /etc/nginx/sites-available/sparta-app /etc/nginx/sites-enabled/

# Remove the default Nginx configuration (optional)
sudo rm /etc/nginx/sites-enabled/default

# Restart Nginx to apply the changes
sudo systemctl restart nginx
echo Reverse proxy configuration done!
```


