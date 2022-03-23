pipeline {
 agent any
 stages {
    stage ("checkout") {
        steps {
            checkout scm
        }
    }
    stage('Clone') {
        
      steps {
              withCredentials([usernamePassword(credentialsId: 'github-account', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        sh "git config user.email test@gmail.com"
                        sh "git config user.name Saurav Khandelwal"
                        //sh "git switch master"
                        sh "cat deploy.yaml"
                        sh "sed -i 's+692851696394.dkr.ecr.us-east-1.amazonaws.com/test.*+692851696394.dkr.ecr.us-east-1.amazonaws.com/test:${DOCKERTAG}+g' deployment.yaml"
                        sh "cat deploy.yaml"
                        sh "git add ."
                        sh "git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/k8s-file.git HEAD:main"
 
 }
}

