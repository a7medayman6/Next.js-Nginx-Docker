# clone the repository 

```bash
git clone https://github.com/a7medayman6/Next.js-Nginx-Docker
```
# copy files

```bash
cp Dockerfile docker-compose.yml .dockerignore $APP

cp -r nginx $APP
```

# run the containers

```bash
docker-compose up 

CTRL+C

docker-compose up -d
```
# check creds 

```bash
docker-compose exec webserver ls -la /etc/letsencrypt/live
```

# changes in docker-compose.service.certbot

replace --staging flag in the command to --force-renewal

# rerun certbot

```bash
docker-compose up --force-recreate --no-deps certbot
```

# generate the key

```bash
docker-compose stop webserver

mkdir dhparam

sudo openssl dhparam -out ./dhparam/dhparam-2048.pem 2048

```
# modify docker-compose.service.webserver

1. add to the webserver volumes 
- dhparam:/etc/ssl/certs

2. add to the volumes section
  dhparam:
    driver: local
    driver_opts:
      type: none
      device: ./dhparam/
      o: bind


# rerun the webserver

```bash
docker-compose up -d --force-recreate --no-deps webserver
```

# check everything is up

```bash
docker-compose ps

curl admin-staging.beyonddigitalhealth-hit.com:80
curl admin-staging.beyonddigitalhealth-hit.com:443
curl https://admin-staging.beyonddigitalhealth-hit.com
curl http://admin-staging.beyonddigitalhealth-hit.com


```