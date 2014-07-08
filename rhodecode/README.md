Dockerfile for java
==

Base image from ubuntu:14.04 with RhodeCode 1.7.2 (last version to be fully GPLv3)


#How to use
---
```
docker run -d -p 5000:5000 codingtony/rhodecode
```

Volumes
---


| important directories | description
|--- |---
|/opt/rhodecode | contains initial config (database and production.ini), you probably want to change this or mount a volume with your database and configuration
|/var/repo | default directory for repo as specified in the initial config

Other info
---

By default this image of RhodeCode will listen on port 5000

Default admin user  :  admin

Default password : admin1234

You can change it at your first login.


