# webcompose
## commands
### build and run the contianers
```sh
docker buildx build -t nginx-lacapsule:alpha . # build lacapsule nginx image if not built
docker compose up -d
docker compose down
```
### enter the server service console
```sh
docker compose exec server sh
```
