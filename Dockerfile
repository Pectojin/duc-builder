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
RUN git clone https://github.com/Pectojin/duplicati_client

# Install Duc dependencies
WORKDIR /opt/duplicati_client
RUN pip install -r requirements.txt

# Build executeable
WORKDIR /opt/duplicati_client/scripts
#RUN ./linux_build.sh
ENTRYPOINT ["./linux_build.sh"]
