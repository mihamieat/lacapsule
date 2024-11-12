# environment variables docker tests
## commands
```sh
docker buildx build -t mymail:latest .
docker compose mymail --env-file .env.mymails up -d
```
