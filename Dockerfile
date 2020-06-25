FROM golang:1.13

# Install ca-certificates
RUN mkdir /app

COPY repos/auth-service /app/auth-service
COPY repos/brain /app/brain
COPY repos/configs /app/configs
COPY repos/data-integration-service /app/data-integration-service
COPY repos/db-toolkit /app/db-toolkit
COPY repos/file-uploader-service /app/file-uploader-service
COPY repos/go-sdk /app/go-sdk
COPY repos/octopus /app/octopus
COPY repos/octopus-service /app/octopus-service
COPY repos/websockets /app/websockets

# Download all dependencies.
RUN cd /app/auth-service && go build && cd /app/data-integration-service && go build && cd /app/file-uploader-service && go build && cd /app/octopus-service && go build && cd /app/websockets && go build

# Get new ssh keys
RUN ssh-keygen -b 2048 -t rsa -f /tmp/sshkey -q -N ""

FROM node:10.9.0

# make the workdir
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# install dependencies first to allow faster rebuilds
COPY repos/brain-frontend/package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.0.2
COPY /repos/brain-frontend /app
RUN ng build

FROM postgres:9.6
LABEL maintainer="Melvin Davis <melvinodsa@gmail.com>"

RUN mkdir -p /home/cuttle-dev && mkdir /root/.ssh && mkdir /root/auth-service && mkdir /root/data-integration-service && mkdir /root/file-uploader-service && mkdir /root/octopus-service && mkdir /root/websockets
COPY --from=0 /tmp/sshkey.pub /root/.ssh/authorized_keys  
RUN chmod 600 /root/.ssh/authorized_keys
RUN apt-get update && apt-get install -y openssh-server && apt-get install ca-certificates && apt-get -y install nginx && apt-get -y install curl && apt-get -y install unzip

COPY --from=0 /app/auth-service/auth-service /root/auth-service/auth-service
COPY --from=0 /app/data-integration-service/data-integration-service /root/data-integration-service/data-integration-service
COPY --from=0 /app/file-uploader-service/file-uploader-service /root/file-uploader-service/file-uploader-service
COPY --from=0 /app/octopus-service/octopus-service /root/octopus-service/octopus-service
COPY --from=0 /app/websockets/websockets /root/websockets/websockets
COPY --from=1 /app/dist/brain-frontend /var/www/html/

COPY db/run.sh /root/run-db.sh
COPY docker/services.sh /root/services.sh
COPY docker/run.sh /root/run.sh
COPY nginx/default-sites.conf /etc/nginx/sites-enabled/default
COPY consul/run.sh /root/run-consul.sh

# installing consul
RUN sh /root/run-consul.sh

EXPOSE 80/tcp
EXPOSE 80/udp
EXPOSE 8080/tcp
EXPOSE 8080/udp
EXPOSE 8081/tcp
EXPOSE 8081/udp
EXPOSE 8087/tcp
EXPOSE 8087/udp
EXPOSE 8078/tcp
EXPOSE 8078/udp
EXPOSE 8500/tcp
EXPOSE 8500/udp

ENTRYPOINT [ "/bin/bash",  "/root/run.sh" ]
