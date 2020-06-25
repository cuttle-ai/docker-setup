cd /root && nohup sh run-db.sh &
ls /root
sh /root/services.sh
service nginx start
tail -f /root/nohup.out -f /root/auth-service/nohup.out -f /root/data-integration-service/nohup.out -f /root/file-uploader-service/nohup.out -f /root/octopus-service/nohup.out -f /root/websockets/nohup.out -f /root/consul.out