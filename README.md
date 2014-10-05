#Docker Files for Various Projects

The goal of this repository is to provide docker images that host a complete environement
for development related projects and also to promote and quickly show the capability of Butor framework.

---

##Currently Available

* java : creates a basic Ubuntu 14.04 image with Oracle JDK 7
* mule : based on codingtony/java and installs a vanilla version of Mule ESB 3.5.0
* tomcat7 : based on codingtony/tomcat7 and installs a vanilla version of Tomcat 7.0.54
* rhodecode : the source management platform for Git and Mercurial repository  (v. 1.7.2)
* artifactory : A popular opensource repository manager for Maven
* jenkins : A popular opensource continuous integration (CI) engine

##Planned

* haproxy : Haproxy 1.5
* mysql : MySQL (or MariaDB) 5.5
* butor-demo webapp
* butor-demo services
* butor-demo data


## Quick Tutorial on Docker persistance

If you need to persist the data to a volume, you will need to build a *data only container* and create volumes on it. Then you will need to use volumes from that data container when you start your other containers. Here's how to proceed :

### Creating the data only container

Here I want the volumes /opt/rhodecode and /var/repo, and we need to name it so that we can refer to it later. I use tianon/true since it is probably the smallest Docker image available.

```
docker run -v /opt/rhodecode -v /var/repo   --name "rhodecodedata" tianon/true
```

Then you want to use the volume from that named container when you start your image. 
The changes you do in /opt/rhodecode and in /var/repo will be persisted. Initialy theses directory will be *EMPTY*

The way to do it :
```
 docker run -ti --volumes-from rhodecodedata codingtony/rhodecode bash
```


If you don't add the ```--volume-from rhodecodedata``` to the command line, you will see the original content from the image

```
 docker run -ti -p 5000:5000   codingtony/rhodecode ls /opt/rhodecode
```

When you are ready to start (as a daemon) an image with the change saved in the volumes you can simply do :
```
docker run -d -p 5000:5000  --volumes-from rhodecodedata codingtony/rhodecode
```

***VERY IMPORTANT***

The volume you try to mount in the image must not be symlinks, they must be real paths!  Otherwise you will get "Cannot start container...  not a directory" when you try to start the image with ```--volumes from```


## Backup a Docker Data Container

### Automatically

I've built a tool to easily backup volumes from data containers

Fetch backupContainer.sh from this repo :
```
wget https://raw.githubusercontent.com/codingtony/docker/master/backupContainer.sh
chmod +x backupContainer.sh
```
And backup easily with :
```
./backupContainer.sh containerdataname /backup/destination/directory
```

This will create a timestamped tar.gz file named /backup/destination/directory/backup-containerdataname-YYYYMMDD_HHmmSS.tar.gz

Enjoy!


### Manually 

If you prefer to do it manually :

This create a timestamped tgz file in the current directory containing the /var/repo and /opt/rhodecode from your data image

```
docker run  --rm --volumes-from  rhodecodedata busybox tar cpf - /var/repo /opt/rhodecode | gzip > backup-rhodecodedata-$(date +"%Y%m%d_%H%M%S").tar.gz
```




