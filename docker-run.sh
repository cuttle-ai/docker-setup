docker run -it --env-file=.env-docker -p 4200:80 -p 8078:8078 -p 8081:8081 -p 8087:8087 -p 8080:8080 -p 8500:8500 --name cuttle-platform cuttle-platform bash