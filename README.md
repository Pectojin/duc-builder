# Duplicati client builder images
This repository is for docker and docker-compose files that will allow building Duplicati client executeables in a disposable environment

Currently I've only setup a Debian environment

# Usage
Clone the repo

    git clone https://github.com/Pectojin/duc-builder

Go in and create a releases folder for the container to mount

    cd duc-builder
    mkdir releases

Build and run the container

    docker-compose up

Once the container finishes running collect the build in the `releases` folder previously created
