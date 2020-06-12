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
```

Update the google client id and secret in the `.env` file.

For the first time run the following command to build and start the platform

```bash
sh setup.sh
```

Once setup, the platform can be started by running the following command

```bash
sh start.sh
```
