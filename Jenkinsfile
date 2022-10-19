pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                sh('docker build -t valipivenkatesh/venkatesh_jenkins_dockerhub .')
            }
        }
        stage('Publish to Hub/Registry') {
            steps {               
                sh('docker login -u valipivenkatesh -p Valipi8515@')
                echo "successfully connected to Docker-Hub"
                echo 'publishing to Hub'
                sh('docker push valipivenkatesh/venkatesh_jenkins_dockerhub')
                echo 'pushed image to docker hub'
            }
        }
        stage('pull image from hub/registry') {
            steps {
                echo 'pulling image from docker hub'
                sh('docker pull valipivenkatesh/venkatesh_jenkins_dockerhub')
                echo 'pulled image valipivenkatesh/venkatesh_jenkins_dockerhub'
                sh('docker images')
            }
        }
        stage('start a container') {
            steps {
               sh '''if [ $(docker ps | awk \'{print $NF}\' | grep venkatesh-jenkins-container) = \'venkatesh-jenkins-container\' ]; then
                        docker stop "venkatesh-jenkins-container"
                        docker rm "venkatesh-jenkins-container"
                fi'''
                sh('docker run -it -d -p 8084:80 --name venkatesh-jenkins-container valipivenkatesh/venkatesh_jenkins_dockerhub')
                sh('docker exec venkatesh-jenkins-container service nginx start')
            }
        }
    }
}
