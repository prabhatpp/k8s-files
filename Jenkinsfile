pipeline {
 agent any
    environment {
        AWS_ACCOUNT_ID="692851696394"
        AWS_DEFAULT_REGION="us-east-1" 
        IMAGE_REPO_NAME="test"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
        IMAGE_TAG1="${env.BUILD_NUMBER}"
        IMAGE_TAG2="${env.GIT_COMMIT}"
        IMAGE_TAG3="latest"
        TASK_DEF="test-task:5"
  }
 stages {
    stage ("checkout") {
        steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sauravsa21/django-multiple-user-types-example']]])
        }
    }
    stage('Clone') {
        
      steps {
        sh "rm -rf django-multiple-user-types-example"
        sh "git clone https://github.com/sauravsa21/django-multiple-user-types-example.git/"
         
      }
    }
    stage('Building') {
      steps {
        sh "pwd" 
        sh "env"
        sh "docker build -t test -f django-multiple-user-types-example/Dockerfile django-multiple-user-types-example/"
     }
    }
    stage('Deploy') {
      steps {
            sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 692851696394.dkr.ecr.us-east-1.amazonaws.com"
            sh "docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}:$IMAGE_TAG1"
            sh "docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}:$IMAGE_TAG2"
            sh "docker tag ${IMAGE_REPO_NAME}:latest ${REPOSITORY_URI}"
            sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG1}"
            sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG2}"
            sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG3}"
     }
    }
    stage('Updaing task defintiton') {
      steps {
            sh "export BUILD_NUMBER=${IMAGE_TAG1} && ./django-multiple-user-types-example/script.sh"
            }    
     }
 
 }
}

