FROM debian:8

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget python3 python3-dev git zip binutils

# Install pip
RUN wget "https://bootstrap.pypa.io/get-pip.py"
RUN python3 get-pip.py
RUN rm get-pip.py

# Install dependencies
RUN pip install pyinstaller

# Get duc source
WORKDIR /opt/
RUN git clone https://github.com/Pectojin/duplicati-client

# Install Duc dependencies
WORKDIR /opt/duplicati-client
RUN pip install -r requirements.txt

# Go build script directory
WORKDIR /opt/duplicati-client/scripts

# Have to make sure we're on the current master HEAD
RUN git pull origin master
