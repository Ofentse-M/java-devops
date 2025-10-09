pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven 'maven_3' 

    }

    stages {
        stage('Build maven') {
            steps {
                // Get some code from a GitHub repository
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ofentse-M/java-devops']])

                // Run Maven on a Unix agent.
                sh "mvn clean install"
            }
        }
        stage ('Build image'){
            steps{
                script{
                    sh 'docker build -t ofentsem/java-application-devops .'
                       }
                 }
            }
        stage ('Push image to dockerhub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u ofentsem -p ${dockerhubpwd}'
} 
                    sh 'docker push ofentsem/java-application-devops'
                }
            }
            }
        stage ('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml', kubeconfigId: 'k8sconfigpwd')
        }    
        }
    }    
}
}