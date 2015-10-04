===================================================================
[SilverStripe Docker image dyatlov/silverstripe](https://hub.docker.com/r/dyatlov/mesos-dev/)
===================================================================

This is the source of a Docker image to install and run SilverStripe.

**Note:** This is for development purposes only; the root database user has no password.

Usage
=====

Install Docker
--------------

If you don't have Docker on your machine, install it following the instructions on the Docker's  [Supported installation page](https://docs.docker.com/installation/).

New project
-----------

To begin a new project:

```bash
mkdir new_project
cd new_project
run -v `pwd`:/var/www dyatlov/silverstripe new.sh
```

Then proceed with the following section.

Existing SilverStripe web-site
------------------------------------

1. Create a Docker container. This step is supposed to be made only when you start your web-site for a first time (you can use different container names for different projects):

```bash
cd path/to/your/existing/silverstripe/project
docker create --name my_website -p 3000:80 -v `pwd`:/var/lib/mysql dyatlov/silverstripe start.sh
```
1. Start the Docker container:

```bash
docker start my_website
```

1. Access your web-site. If you are running Docker on a Linux machine, simply open [http://localhost:3000](http://localhost:3000) in your borwser. If you are using [Docker Toolbox](https://www.docker.com/toolbox) (Mac/Windows machine), run the following command in your Docker terminal: 

```bash
docker-machine ip default
```

It will show you an IP address of your Docker virtual machine. Past it to the browser and postfix it with the port number: http://192.168.99.100:3000

1. Stop the Docker container

```bash
docker stop my_website
```
Credits
=======

This Docker image is heavily based on [sminnee/docker-silverstripe-lamp](https://github.com/sminnee/docker-silverstripe-lamp)
