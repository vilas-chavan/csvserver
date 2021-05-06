#########Commands Executed for Part-1###########

	# docker pull infracloudio/csvserver:latest
	# docker pull prom/prometheus:v2.22.0
	# docker images
	# docker run -d infracloudio/csvserver
	# docker ps -a
	# docker inspect <container ID>

"error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory"

- container not able to find the "inputdata" file since it is not getting start
- simply create one file "inputFile" in "/solution/inputdata/" directory and pass the file to container by volume mounting
	# docker run -d -v /csvserver/solution/inputdata/inputFile:/csvserver/inputdata infracloudio/csvserver
- now container will show up status.
- stop the container and delete it
	# docker stop <container_id>
	# docker rm <container_id>
- write a bash script with "gencsv.sh" to generate a file named "inputFile" in solution directory
- run the bash script,
	# sh gencsv.sh 
- it will generate output file with "inputFile" name in "/solution/inputdata/" directory
- Run the container again in the background with file generated
	# docker run -d -v /csvserver/solution/inputdata/inputFile:/csvserver/inputdata infracloudio/csvserver
	# docker ps -a
	# docker exec -it <conatiner_id> bash
	# exit
	# docker inspect <container_id>   //to check the container port number it is runnung on 9300 port
- stop the container and delete it
	# docker stop <container_id>
	# docker rm <container_id>
- Run the container again and expose on port 9393:9300 and Set the environment variable `CSVSERVER_BORDER` to have value `Orange`
        # docker run -d -v /csvserver/solution/inputdata/inputFile:/csvserver/inputdata -e CSVSERVER_BORDER=Orange -p 9393:9300 infracloudio/csvserver 
        # docker ps -a
- Go to the browser and check url "http://localhost:9393". It will shows the 10 entries from `inputFile` and the welcome note should have an orange color border
