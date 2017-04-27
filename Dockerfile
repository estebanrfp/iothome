# Dockerfile
# FROM armhf/alpine
FROM hypriot/rpi-node
# FROM hypriot/rpi-node:6.9
MAINTAINER Esteban Fuster Pozzi <estebanrfp@gmail.com>
RUN npm install pm2 -g
# Set environment variables
# ENV appDir /var/www/app/current

# Run updates and install deps
# RUN apt-get update && apt-get install -y \
#     git-core \
#     build-essential \
#     wget \
#     gcc \
#     python \
#     python-dev \
#     python-pip \
#     python-virtualenv \
#     --no-install-recommends && \
#     rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y \
#   apt-utils \
#   clang \
#   xserver-xorg-core \
#   xserver-xorg-input-all \
#   xserver-xorg-video-fbdev \
#   xorg \
#   libdbus-1-dev \
#   libgtk2.0-dev \
#   libnotify-dev \
#   libgnome-keyring-dev \
#   libgconf2-dev \
#   libasound2-dev \
#   libcap-dev \
#   libcups2-dev \
#   libxtst-dev \
#   libxss1 \
#   libnss3-dev \
#   fluxbox \
#   libsmbclient \
#   libssh-4 \
#   fbset \
#   libexpat-dev && rm -rf /var/lib/apt/lists/*

# kiosk
RUN apt-get update && apt-get install -y \
    git-core \
    wget \
    chromium-browser \
    xserver-xorg \
    xserver-xorg-legacy \
    lsb-release \
    xinit && rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /data

RUN git clone https://github.com/estebanrfp/iothome.git /data/
# RUN chmod +x /data/startkiosk.sh
# Add our package.json and install *before* adding our application files
# ADD package.json ./

ADD start.sh ./

RUN npm i --production

# Add application files
# ADD . /data

CMD ["pm2-dev", "process.yml"]