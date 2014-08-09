# Artifactory 3.3.0

This Dockerfile creates an image to run a clean Artifactory installation

Artifactory listen on port 8081 by default

To start it (deamonized) :
```
docker run -d -p 8081:8081 codingtony/artifactory
```


| important directories | description
|--- |---
|/opt/artifactory | This is the Artifactory HOME
|/opt/artifactory/data | This is the Artifactory DATA folder, you probably want to mount a data container with a volume there.
|/opt/artifactory/logs | This is the Artifactory LOGS folder, you probably want to mount a data container with a volume there.


## How to create a data container for artifactory
```
docker run --name "artifactorydata" -v /opt/artifactory/data -v /opt/artifactory/logs tianon/true 
```

## How to use artifactory with the data container

```
docker run -d -p 8081:8081 --volumes-from artifactorydata  codingtony/artifactory
```

If you need to upgrade or setup, you probably want to log to the image and update the configuration you will simply to this :

```
docker run -ti -p 8081:8081 --volumes-from artifactorydata  codingtony/artifactory bash
```


