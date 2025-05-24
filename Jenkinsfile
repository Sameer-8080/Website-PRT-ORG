pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dhubcred')
    }
    agent {
        label 'K-M'
    }
    stages {
        stage('Git') {
            steps {
                git 'https://github.com/Sameer-8080/Website-PRT-ORG'
            }
        }
        stage('Docker') {
            steps {
                sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                sh 'sudo docker build /home/ubuntu/jenkins/workspace/test-prt-pipeline/ -t ilamparidhi/prt-task'
                sh 'sudo docker push ilamparidhi/prt-task'
            }
        }
        stage('K8s') {
            steps {
                sh 'kubectl apply -f Deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
