# Jenkins (1.617)

This Dockerfile creates an image to run a clean Jenkins installation based on Ubuntu. With following packages installed :
   * Apache Maven 3.3.3
   * unzip 
   * curl 
   * git 
   * mercurial 
   * rpm 
   * make 
   * graphviz

Jenkins listen on port 8080 by default

To start it (deamonized) :
```
docker run -d -p 8080:8080 codingtony/jenkins
```


| important directories | description
|--- |---
|/opt/jenkins/data | This is the JENKINS HOME


## How to create a data container for Jenkins
```
docker run --name "jenkinsdata" -v /opt/jenkins/data  tianon/true 
```

## How to use Jenkins with the data container

```
docker run -d -p 8080:8080 --name "jenkins" --volumes-from jenkinsdata  -v /etc/localtime:/etc/localtime:ro -v /etc/sysconfig/clock:/etc/sysconfig/clock:ro codingtony/jenkins
```

If you need to setup stuff in /opt/jenkins/data,  you probably want to log to the image and update the configuration you will simply to this :

```
docker run --rm -ti -p 8080:8080 --volumes-from jenkinsdata -v /etc/localtime:/etc/localtime:ro -v /etc/sysconfig/clock:/etc/sysconfig/clock:ro codingtony/jenkins bash
```


