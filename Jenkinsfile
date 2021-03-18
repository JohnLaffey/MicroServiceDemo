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
        withKubeConfig([credentialsId: '<kubernetes-admin>',
                    caCertificate: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJV3dFaURFd0gvUVV3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TVRBek1Ea3lNek0
1TlRaYUZ3MHlNakF6TURreU16UXdNRE5hTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXhZMXhPZlJGSFVBTG1JclkKR1A1TmE2VlozZHRRWUhZMUMzTTEySjArS0gxR3J1NVZ1TDBSWlZZZEN6M2hSTG83QXd5UkMzeG8zZURPYmlBWgorQi9rRjJqVmE0enNJcDRqWWRxcEZjR1FSWmNUMWxibFRQNmhvdDhKdkthWUwyR2pVWlI4d1ovSzZaLzJDZVRPCjlueUFLSndqT01YQXNpMG9XYU1IcDZ6TWZaSEI1MFpQNHBQNVd5dFo0VVVaNHc5ZXZxOTVveEt5Z1lzNDhpUEMKWkFlRzYzOXRXYmM4cE42emFqWloxT241ekJmcnRsYWJkbmRUSDNiUTNMSWNBcnZqSTFYcElBU1N6UlIxQ2ZmQwp6c2hYMjBvNGk2dEhDcTc4Nkd1OU1KNVRKUnhEK3IxOXpNSkJBUUtRbmVSNW5Jb2hOOS9pSUtzUG5jdVF6OVVNClVPQlFWUUlEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVUyeGVjeWZ1L282cUEveG0raGpkZFpNbnV1L0V3RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFIaWQ4d25lOStMM0NZZUN4a0JCVmFvb25RNmpEYlllZVRmbS81VVUwczhHWFl1TXQ5cE9TQVRnCnV0M0crY1ZlaDdGREJYaWZUUVRYcS9Zbmt3RW5yLzRHc1F1dXZJc0dNcTM1N0JHQ285VEpnL01kUDRIZG9nTzUKVWRsQlUxc1dmMEdYaVk5OWtGUDRtcjc2aHhlTFhtTVlrTzIxOFFQak9xUXlxaU9kRmlBbWtlenVQakRuamJvawpVR1NacVk3eHh1YlZ5UGpYZm02SjNrNW40d29nODZSa2duZjBoMU9JS0VraTAzQjE2VkY3SjNjMlNRRDVEc3diCkIrQ2RGYzkyQ3J6bU1Tc05tbWFvUDMrdHNaQUI2UkJWNzdRMDRRUUhJU1VIVHhSVm9xZGdHTHBHS29YblNhcWQKdmI2alIvMlNkNDFlNmxXZlpIOXRFbTlQZS9YTHhldz0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                    serverUrl: '<https://192.168.0.41:6443>',
                    contextName: 'kubernetes-admin@kubernetes',
                    clusterName: 'kubernetes',
                    namespace: 'default'
                    ])
        echo 'Hi!  I am stage one'
        sh 'export KUBECONFIG=/.kube/config'
        sh 'ls /.kube/config'
        sh 'cat /.kube/config'
      }
    }
  }
}
