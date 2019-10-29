# docker-setup
Docker compose setup for the platform

## Setup 
```bash
git clone https://github.com/cuttle-ai/docker-setup
git submodule update --init
git submodule update --init --recursive
cp sample.env .env
```
Update the google client id and secret in the env file
```bash
docker-compose build
docker-compose up
```
