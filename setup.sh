rm -rf repos
mkdir repos
git clone https://github.com/cuttle-ai/auth-service repos/auth-service
git clone https://github.com/cuttle-ai/brain repos/brain
git clone https://github.com/cuttle-ai/octopus repos/octopus
git clone https://github.com/cuttle-ai/configs repos/configs 
git clone https://github.com/cuttle-ai/db-toolkit repos/db-toolkit
git clone https://github.com/cuttle-ai/brain-frontend repos/brain-frontend
git clone https://github.com/cuttle-ai/octopus-service repos/octopus-service
git clone https://github.com/cuttle-ai/octopus repos/octopus
git clone https://github.com/cuttle-ai/brain repos/brain
git clone https://github.com/cuttle-ai/data-integration-service repos/data-integration-service
git clone https://github.com/cuttle-ai/file-uploader-service repos/file-uploader-service
git clone https://github.com/cuttle-ai/go-sdk repos/go-sdk
docker-compose build
docker-compose up
