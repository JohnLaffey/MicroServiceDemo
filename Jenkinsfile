pipeline {
  agent {
    node {
       label 'tp'
        }
  environment {
    color = 'purple'
  }    
  }      
  stages {
    stage('getvars') {
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
          sh 'telepresence connect'
          sleep 10
          sh 'telepresence intercept dataprocessingservice --port 3000 --mount=false'
          sleep 10
          sh 'result=$(curl -s "http://localhost:3000/color")'
          if (expression {color !== result}) {
            currentBuild.result = 'ABORTED'
            error ('Values do not match, stopping pipeline')
          }}
          }

        }
        }  
      }
}
