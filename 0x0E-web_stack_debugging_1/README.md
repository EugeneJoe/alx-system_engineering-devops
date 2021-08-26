# Web stack debugging #1

![image](https://user-images.githubusercontent.com/44834632/130576818-d55f773a-83cb-4229-a464-fc033123f919.png)


This project is aimed at improving our web stack debugging skills.

# Files

Below task files were used for this project.

[0-nginx_likes_port_80](./0-nginx_likes_port_80)

First, I tried querying the server on port 80

'''.sh

root@968cfb80a609:/# curl 0:80
curl: (7) Failed to connect to 0 port 80: Connection refused
root@968cfb80a609:/#

'''

This prompted me to check whether there was any process listening on port 80.

'''.sh

root@968cfb80a609:/# netstat -lpn

'''

This showed me that nginx was listening on port 8080 rather than port 80.

So, I checked the nginx configuration files to see on what port nginx had been configured to listen on.

I started by checking '/etc/nginx/sites-available/default', which was properly configured.
Next I checked '/etc/nginx/nginx.conf' which was also properly set up.
Then I checked '/etc/nginx/sites-enabled/default' which showed me that nginx was listening on port 8080 rather than port 80.

I changed this to port 80 and restarted nginx after which I querried the server again as shown above. The problem has been solved.
