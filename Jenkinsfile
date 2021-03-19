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
                    caCertificate: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1ETXdPVEl6TXprMU5sb1hEVE14TURNd056SXpNemsxTmxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTDVvCjRlbW1xZ1VlbHREd1NmTnRSc1NjdTJZSHBHdzFpMXV0aUEzblNLVnkyZ2lFTmVIWWpZWk5wSFUyQ2xDM0NOWGoKZTRtRTdvVk9ySXZTK3o0Y3dhT0JSRktXUGxsTTR6b0I3Y3FZcm9XdTB1enRFLzVJYThZVmFBMzhnVk5EOEZ4SgpwdGc4ZlNqQWovOHM5K1dpVXlXUVNSNmtQbkVhaG9DZXRONlVVS1M1R0JHUG5zVjc4STdKSHFDMVViRXpsbUlwClhvemRUUVpaK0RsOXRuN3J3cEtnV21DcHRiUUxySzRZVDFIQUw5Um9KVHVaMGJkN3h1WHpaOGhpdWJNRlN4dHcKYktIZ2VUWUdtOVkrQWltQ3NjVEd1QmN0YnVhUjZ6Y3lRb1F4SGdaUkQ5R3RuUGsybGdGRWMxZDRZMHgrdDNrUQpCT1Z4c09RUjhLK1g1Zml6UXAwQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZOc1huTW43djZPcWdQOFp2b1kzWFdUSjdydnhNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFDNGROQ2o4d3RSYkk0clB4aWNYY3c5a3J0U1pteDNyWFNMMzhLRlFaRWRiaCtvQ0pqRQpNME1aR1JvdHUyaTgxVmlQeElUMjFwZEkyNDdKZWRlNktoUTVDakNJbEkxN1FPZSt2QnNRNlNXOFdlTHFaZGp0CmxxZ0RSZWtSbnZpVklnenZZaUYwNSs1dStzZ3RkZU15WXNDcUlGb0czZTVYa0JzZDNEKzd2MHdxeGZzUEFvVVUKK0plQTdRbDkyb3pwV3VEb2NKUTNZcC84STR4c3FOL09ZNFoweXBJM1F4OGZ5YU4vVVVWTW5tcGJBMlBqdWRpVApVdUUzNFNPeC85UlV3N2h6ZTFqdmxKTGhqQkp6T3M5Y0xvcW8wYVJ5MEhDM09TV2o3a1A2TyttM3dtTjR0NjRoCnVGVnR1Smc0aVFBM3FYNkFoakNqVkE3R2NwUHp3UGpSQUsrbAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==',
                    serverUrl: 'https://192.168.0.41:6443',
                    contextName: 'kubernetes-admin@kubernetes',
                    clusterName: 'kubernetes',
                    namespace: 'default'
                       ])
        {
        dir("/Users/johnlaffey/ambassador/edgey-corp-nodejs/DataProcessingService")  {
          sh 'npm install&'
          sleep 10
          sh '(npm run start&)'
          sleep 15
          sh 'result=$(curl -s 'http://localhost:3000/color')'
          if (expression {color !== result}) {
            currentBuild.result = 'ABORTED'
            error ('Values do not match, stopping pipeline')
          }}
          }

        }
        }  
      }
    }
  }
}
