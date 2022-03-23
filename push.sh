#!/bin/bash
#set +x # Don't echo credentials from the login command!
#            echo "Building New ECR Image"
#            eval $(aws ecr get-login --region us-east-1 --no-include-email)
#            # Enable Debug and Exit immediately 
#            set -xe
 test=$(aws ecr get-login --region us-east-1 --no-include-email)
 echo `$test`
#docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}:$IMAGE_TAG1
#docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}:$IMAGE_TAG2
#docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}
#docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG1}
#docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG2}
#docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG3}          
