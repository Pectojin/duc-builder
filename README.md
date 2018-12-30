# Duplicati client builder images
This repository is for docker and docker-compose files that will allow building Duplicati client executeables in a disposable environment

Currently I've only setup a Debian environment

# Usage
Clone the repo

    git clone https://github.com/Pectojin/duc-builder

Go in and create a releases folder for the container to mount

    cd duc-builder
    mkdir releases

Build, run the container, and run the linux_build.sh script

    docker-compose up --build
    docker-compose run duc-builder bash

or run the script directly

    docker-compose run duc-builder ./linux_build.sh

Once the container finishes running collect the build in the `releases` folder previously created
