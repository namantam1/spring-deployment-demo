
## Steps to build and run with docker

```bash
# build the docker image
docker build -t app .

# run the built docker image and expose application to port 8080
docker run -p 8080:8080 app

# For help run for more info about these commmands
docker --help
docker build --help
docker run --help
```

> One can run this project on `play-with-docker` to test.
