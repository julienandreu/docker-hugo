# docker-hugo
Docker image for Hugo framework for building websites : https://gohugo.io/



## Usage



### Serve

```bash
$ docker run -d -p 1313:1313 -v YourSitePath:/home/hugo/site --name="hugo-container" julienandreu/docker-hugo hugo server -D --bind=0.0.0.0
--name="hugo-container"

$ docker ps
CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                    NAMES
54ffa297fd16        julienandreu/docker-hugo   "hugo server -D --bi…"   4 seconds ago       Up 2 seconds        0.0.0.0:1313->1313/tcp   hugo-container
```



### Build

```shell
$ docker run -v YourSitePath:/home/hugo/site -t julienandreu/docker-hugo hugo
```



### Other commands

You can use all commands available on **hugo cli** :

https://gohugo.io/commands/