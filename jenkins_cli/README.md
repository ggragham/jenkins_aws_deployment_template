# Jenkins CLI Docker Image

Docker image for Jenkins CLI

## How to build

```bash 
DOCKER_BUILDKIT=1 docker build . -t jenkins_cli
```

## How to run

1. Prepare .env file
   
```bash
cp .env_template .env
```
2. Add to .env file Jenkins URL and credentials (see [Jenkins CLI documentation](https://www.jenkins.io/doc/book/managing/cli/#using-the-cli-client))
   
3. Run docker container with Jenkins CLI
   
```bash
docker run --env-file .env -it jenkins_cli
```

## How to use

Just type ```jcli``` inside the container shell and use built-in commands.  

Example:

```bash
$ jcli who-am-i
Authenticated as: john_smith
Authorities:
  authenticated
```

To list Jenkins CLI commands run:

```bash
jcli help
```
