pipeline {
  node ("k8s")
  stages {
    stage('stageone') {
      environment {
        color = 'purple'
      }
      steps {
        echo 'Hi!  I am stage one'
      }
    }
  }
}
