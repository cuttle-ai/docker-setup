docker-compose down
sh repos.sh
FILE_UPLOADER_PUBLIC_KEY=$(cat id_rsa.pub) FILE_UPLOADER_PRIVATE_KEY=$(cat id_rsa) docker-compose build
docker-compose up
