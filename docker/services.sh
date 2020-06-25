cd /root/auth-service && nohup IS_AUTH_SERVICE=true ./auth-service &
cd /root/data-integration-service && nohup ./data-integration-service &
cd /root/file-uploader-service && nohup ./file-uploader-service &
cd /root/octopus-service && nohup ./octopus-service &
cd /root/websockets && nohup ./websockets &
nohup consul agent -dev > /root/consul.out &
