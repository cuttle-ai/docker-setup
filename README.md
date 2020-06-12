# docker-setup

Docker compose setup for the platform

## Setup

```bash
git clone https://github.com/cuttle-ai/docker-setup
cd docker-setup
cp sample.env .env
ssh-keygen
cp ~/.ssh/id_rsa id_rsa
cp ~/.ssh/id_rsa.pub id_rsa.pub
sh setup.sh
```

Update the google client id and secret in the env file

```bash
docker-compose build
docker-compose up
```
