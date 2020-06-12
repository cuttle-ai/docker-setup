FROM postgres:9.6
LABEL maintainer="Melvin Davis <melvinodsa@gmail.com>"
ARG FILE_UPLOADER_PUBLIC_KEY

RUN mkdir -p /home/cuttle-dev && mkdir /root/.ssh && echo "$FILE_UPLOADER_PUBLIC_KEY" >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
RUN apt-get update && apt-get install -y openssh-server

COPY run.sh /root

ENTRYPOINT [ "/bin/bash",  "/root/run.sh" ]