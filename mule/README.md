#Dockerfile for Mule
Based on codingtony/java. With Mule ESB 3.5.0 (installed in /opt/mule)


## Download the image from the repo
```
docker pull codingtony/mule
```

### Use it with your Mule application
| volume | description
|--- |---
|/opt/mule/apps | Application directory
|/opt/mule/conf | Configuration & log4j configuration. wrapper.conf is mandatory
|/opt/mule/logs | Log files
|/opt/mule/domains | Domains directory


#### Example

For an application that listen on http://0.0.0.0:8888
Will start as a deamon, with the name "mymule"


```
docker run -d -name mymule -p 8888:8888 -v /somewhere/where/myapps/is:/opt/mule/apps -v /somewhere/where/iwanttolog:/opt/mule/logs codingtony/mule
````

To check the stdout :
```
docker logs mymule
```

To stop the container :
```
docker kill mymule
```

To "log" on the image and see how it's built
```
docker run -it codingtony/mule bash
```



For a more complex networking scenario, use [pipework](https://github.com/jpetazzo/pipework "")
