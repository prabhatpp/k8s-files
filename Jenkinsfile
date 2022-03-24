pipeline {
    agent any
        parameters {
        string(name: 'DOCKERTAG', description: 'enter env value')
    }
    stages {
           stage ("checkout") {
       steps {
           checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sauravsa21/k8s-files.git']]])
       }
   }

        stage('Example') {
            steps {
                script{
                    sh "cat deploy.yml"
                    sh "sed -i 's+692851696394.dkr.ecr.us-east-1.amazonaws.com/test.*+692851696394.dkr.ecr.us-east-1.amazonaws.com/test:${params.DOCKERTAG}+g' deploy.yml"
                    sh "cat deploy.yml"
                    sh "git add ."
                    sh "git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'"
                }
            }
        }
        stage('Apply Kubernetes files') {
    steps {
     withKubeConfig([credentialsId: 'kubeconfig']) {
      sh 'kubectl apply -f deploy.yml'
     
   }
 }
}

        stage ('pushing') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'git-hub', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        script {
                        sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/k8s-files HEAD:main')
                    }
            }
            }
        }
    }
}
