#Dockerfile for Mule
Based on codingtony/java. With Tomcat 7.0.54  (installed in /opt/tomcat)


## Download the image from the repo
```
docker pull codingtony/tomcat7
```

### Use it with your Mule application
| volume | description
|--- |---
|/opt/tomcat/temp | Temporary directory | 
|/opt/tomcat/webapps | Webapps |
|/opt/tomcat/work | Working directory |
|/opt/tomcat/conf | Configuration |
|/opt/tomcat/logs | Log files |


#### Example

Will start as a deamon, with the name "mytomcat"


```
docker run -d -name mytomcat -p 8080:8080 -v /somewhere/where/mywebapps/is:/opt/tomcat/webapps -v /somewhere/where/iwanttolog:/opt/tomcat/logs codingtony/tomcat7
````

To check the stdout :
```
docker logs mytomcat
```

To stop the container :
```
docker kill mytomcat
```

To "log" on the image and see how it's built
```
docker run -it codingtony/tomcat7 bash
```


For a more complex networking scenario, use [pipework](https://github.com/jpetazzo/pipework "")
