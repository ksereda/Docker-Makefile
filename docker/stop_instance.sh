image_id=`docker inspect --format='{{.Config.Image}}' $1`

if [ -n "$image_id" ]
then
	echo "image_id="$image_id
	docker stop $1
	docker rm $1
	docker rmi $image_id
fi

