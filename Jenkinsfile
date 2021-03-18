pipeline {
  agent {
    node {
       label 'tp'
        }
  }      
  stages {
    stage('stageone') {
      environment {
        color = 'purple'
      }
      steps {
        echo 'Hi!  I am stage one'
        sh 'export KUBECONFIG=/.kube/config'
        sh 'whoami'
      }
    }
  }
}
