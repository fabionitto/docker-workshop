docker ps
ls
docker exec -i $dockerid
echo $dockerid
$(docker exec /bin/sh -c "pandoc -t revealjs -s -o /slides/index.html") < test.md 
ls /slides
sudo 
sudo su
exit
