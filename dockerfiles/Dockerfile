FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    gnupg \
    software-properties-common \
    ca-certificates \
    apt-transport-https \
    xauth \
    x11-apps \
    libx11-dev \
    libxkbfile-dev \
    libsecret-1-dev \
    sudo \
    git \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libgtk-3-0 \
    xdg-utils \
    libx11-xcb1 \
    libx11-dev \
    libasound2 \
    fonts-liberation \
    libappindicator3-1 \
    libgbm1

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
    
RUN apt-get update && apt-get -y install google-chrome-stable

RUN apt-get install -y xauth x11-apps

WORKDIR /home

CMD ["google-chrome","--no-sandbox", "--disable-dev-shm-usage"]

ENV DISPLAY=:0
