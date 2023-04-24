1). First of all out task is to install nginx into target machine.
2). we are going to chnage the config file of a nginx.
3). we are providing our own style to our nginx homepage.

Instructions:
1). untar the provided file.
2). you can see Nginx_deploy.sh file. run this file by command "sh Nginx_deploy.sh".
3). enter the user name of target machine and IP of target machine.
Now you can see the below process will done automatically.
1). Install nginx into target machine.
  A). provide username and password of target machine.
  B). copying SSH_ID to target machine
  c). installing Ngnix server and restarting the starting the services.
  D). Enablelling port 80.
2). we are going to chnage the config file of a nginx.
  A). we are coping our HTML file in nginx default folder.
3). we are providing our own style to our nginx homepage.
  A). we are copying styles.css file in style folder.
4). retartiig the Nginx Server to see our chnages.
after the process.
go to website and search with target machine ip:80 (targetmachineip:80)
RESULT:  hello world page will appear.
