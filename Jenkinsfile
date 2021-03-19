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
        withKubeConfig([credentialsId: 'e1edc5dd-52de-42fe-9451-732149a23353',
                    caCertificate: 'MyClusterTLSCertificate',
                    serverUrl: 'https://mykubernetes',
                    contextName: 'kubernetes-admin@kubernetes',
                    clusterName: 'kubernetes',
                    namespace: 'default'
                       ])
        {
        dir("/Users/me/ambassador/edgey-corp-nodejs/DataProcessingService")  {
          sh 'npm install&'
          sleep 10
          sh '(npm run start&)'
          sleep 15
          sh 'result=$(curl -s "http://localhost:3000/color")'
          if (expression {color !== result}) {
            currentBuild.result = 'ABORTED'
            error ('Values do not match, stopping pipeline')
          }}
          }

        }
        }  
      }
post {
    unsuccessful {
     echo 'This build has failed.'   
    }         
     slackSend channel: '#my-development-channel',
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${BUILD_USER}\n More info at: ${env.BUILD_URL}"
}           