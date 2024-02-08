# k8S initcontainer to run envsubst

## Scope
This is intended for use in the kubernetes helm chart for geOrchestra, as an initcontainer, once the datadir has been cloned (and before the pods are started).

## What ? Why ?
It all began with the idea to use environment variables in the datadir, wherever possible.

Thing is, while they are resolved on most of the files, there are a few cases when it isn't that smooth. Namely for now, datafeeder/frontend-config.json, the conf file for the ogc-api-records microservice for geonetwork, and more important, security-proxy/target-mappings.properties.

In the long run, it will be preferable to fix this in the apps themselves. But let's be honest, we might need that possibility from time to time anyway.

## Usage

This is a very simple image. To run it, you need to
- mount the files
- declare the environment variables to use
- specify the path to the files that will be processed, in the `SUBST_FILES` environment variable
- run the container with an UID allowed to overwrite the files you want to process

For example,
```
# If you want to build it locally
docker build -t georchestra/k8s-initcontainer-envsubst .
# test it locally (replace ${FQDN} occurrences in the datafeeder config file)
docker run -u 1000:1000 -it --name envsubst --rm -v $(HOME)/dev/georchestra/datadir:/etc/georchestra -e FQDN=georchestra.mydomain.org -e SUBST_FILES="/etc/georchestra/datafeeder/frontend-config.json" georchestra/k8s-initcontainer-envsubst:latest
```

> **Important note:** only the existing environment variables (i.e. the ones output by the `env` command) will be substituted. This includes environment variables defined to an empty string.  
This means that if there are customs tokens in the `${token}` format in the processed files, these will stay untouched.
