FROM debian:latest

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
WORKDIR /opt/duplicati_client
RUN pip install -r requirements.txt

# Build executeable
WORKDIR /opt/duplicati_client/scripts

# Workaround to invalidate cache to make Docker always run the following commands when building 
# https://stackoverflow.com/questions/37013947/force-a-docker-build-to-rebuild-a-single-step
ARG CACHE_DATE=2016-01-01

# Have to make sure we're on the current master HEAD
RUN git pull origin master

ENTRYPOINT ["./linux_build.sh"]
