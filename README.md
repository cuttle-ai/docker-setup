# docker-setup

Docker compose setup for the platform

## Setup

```bash
git clone https://github.com/cuttle-ai/docker-setup
cd docker-setup && sh setup.sh
cp sample.env .env
ssh-keygen
# provide empty passphrase and copy ~/.ssh/id_rsa as FILE_UPLOADER_PRIVATE_KEY and ~/.ssh/id_rsa.pub as FILE_UPLOADER_PUBLIC_KEY to the .env file
```

Update the google client id and secret in the env file

```bash
docker-compose build
docker-compose up
```
