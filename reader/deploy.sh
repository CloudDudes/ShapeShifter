./../ecrLogin.sh
IMAGE_REPO=`aws ecr describe-repositories --repository-names shapeshifter | jq -r '.repositories[].repositoryUri'`
echo 'Found repo' "$IMAGE_REPO"
MY_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo 'Found your IP' "$MY_IP"

sam build && \
sam deploy \
  --stack-name SHAPESHIFTER \
  --s3-prefix shapeshifter \
  --s3-bucket sodkiewiczm-deployments \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
  --image-repository $IMAGE_REPO \
  --parameter-overrides \
    LocalMachineIp="${MY_IP}" \
  --debug
