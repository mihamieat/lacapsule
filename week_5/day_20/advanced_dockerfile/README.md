# Advanced dockerfile
## commands
### build image
```sh
docker buildx build -t nginx-lacapsule:alpha .
```
### run
```sh
docker run -d -p 8080:81 --name webserver nginx-lacapsule:alpha
```