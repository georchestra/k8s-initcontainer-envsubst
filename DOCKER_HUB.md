# Quick reference

-    **Maintained by**:  
      [georchestra.org](https://www.georchestra.org/)

-    **Where to get help**:  
     the [geOrchestra Github repo](https://github.com/georchestra/georchestra), [IRC chat](https://kiwiirc.com/nextclient/irc.libera.chat/georchestra), Stack Overflow

# Featured tags

- `latest`

# Quick reference

-	**Where to file issues**:  
     [https://github.com/georchestra/georchestra/issues](https://github.com/georchestra/georchestra/issues)

-	**Supported architectures**:   
     [`amd64`](https://hub.docker.com/r/amd64/docker/)

-	**Source of this description**:  
     [docs repo's directory](https://github.com/georchestra/k8s-initcontainer-envsubst/blob/main/DOCKER_HUB.md)

# What is `georchestra/k8s-initcontainer-envsubst`

**K8s-initcontainer-envsubst** is a small utility use environment variable in files before pod starts.

# How to use this image

Example : 
```
# test it locally (replace ${FQDN} occurrences in the datafeeder config file)
docker run -u 1000:1000 -it --name envsubst --rm -v $(HOME)/dev/georchestra/datadir:/etc/georchestra -e FQDN=georchestra.mydomain.org -e SUBST_FILES="/etc/georchestra/datafeeder/frontend-config.json" georchestra/k8s-initcontainer-envsubst:latest
```

## Where is it built

This image is built using Dockerfile within [`k8s-initcontainer-envsubst`](https://github.com/georchestra/k8s-initcontainer-envsubst) repository.

# License

View [license information](https://github.com/georchestra/k8s-initcontainer-envsubst/blob/main/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

[//]: # (Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's georchestra/ directory]&#40;&#41;.)

As for any docker image, it is the user's responsibility to ensure that usages of this image comply with any relevant licenses for all software contained within.