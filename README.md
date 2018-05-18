# PHP + Composer + GMP

**Build and run**

```bash
docker build -t php-with-composer .
docker run  --rm --name my-running-app php-with-composer
```

**Connect**

```bash 
docker exec -it my-running-app bash
```


**With Apache?**

```bash
docker run  --rm -p 8888:80 -v ./www/:/var/www/html --name my-running-app php-with-composer
```


**Tag/update**



```bash 
export DOCKER_ID_USER="digitaldonkey"
docker login
docker tag php-with-composer $DOCKER_ID_USER/php-with-composer
docker push $DOCKER_ID_USER/php-with-composer

```

See [docs.docker.com/docker-cloud/builds/push-images](https://docs.docker.com/docker-cloud/builds/push-images/)