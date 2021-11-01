## Use the command sudo systemctl edit docker.service
## to open an override file for docker.service in a text editor and
## add below  lines(this is for testing purpose only,
##while PROD access or expose Docker api through tls or a proxy)
$ sudo systemctl edit docker.service
[Service]
ExecStart=
#ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375

#Reload the systemctl configuration.

$ sudo systemctl daemon-reload

#Restart Docker.

$ sudo systemctl restart docker.service

#Check to see whether the change was honored by reviewing the 
#output of netstat to confirm dockerd is listening on the configured port.

$ sudo netstat -lntp | grep dockerd
tcp        0      0 127.0.0.1:2375          0.0.0.0:*               LISTEN      3758/dockerd

$ sudo docker -H tcp://<your IP>:2375 ps

