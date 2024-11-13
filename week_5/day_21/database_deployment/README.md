# Database deployment
## commands
```sh
docker buildx build -t db-deploy0:latest . # if image is not available.
docker compose up -d
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id> # to check ip
psql -h 127.0.0.1 -U myuser -d mydatabase 
```
