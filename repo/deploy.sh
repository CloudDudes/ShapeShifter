sam deploy \
  --stack-name SHAPESHIFTER-REPO \
  --s3-prefix shapeshifter \
  --s3-bucket sodkiewiczm-deployments \
  --template-file ./repo/template.yaml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
  --parameter-overrides \
    RepoName='shapeshifter' \
  --debug
