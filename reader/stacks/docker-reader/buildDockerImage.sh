./../../../ecrLogin.sh
IMAGE_REPO=`aws ecr describe-repositories --repository-names shapeshifter | jq -r '.repositories[].repositoryUri'`
IMAGE_NAME='shapeshifter-express-docker'

echo 'repo' "$IMAGE_REPO"
echo 'name' $IMAGE_NAME

echo "Building docker image"
docker build -t $IMAGE_NAME .
echo "Tagging docker image"
docker tag $IMAGE_NAME "$IMAGE_REPO":"$IMAGE_NAME"
echo "Pushing docker image"
docker push "$IMAGE_REPO"