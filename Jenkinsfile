pipeline {
    agent any
    
      

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                sh('docker build -t valipivenkatesh/venkatesh_jenkeins_docker1 .')
            }
        }
        stage('Publish to Hub/Registry') {
            steps {               
                sh('docker login -u valipivenkatesh -p Valipi8515@')
                echo "successfully connected to Docker-Hub"
                echo 'publishing to Hub'
                sh('docker push valipivenkatesh/venkatesh_jenkeins_docker1')
                echo 'pushed image to docker hub'
            }
        }
        stage('pull image from hub/registry') {
            steps {
                echo 'pulling image from docker hub'
                sh('docker pull valipivenkatesh/venkatesh_jenkeins_docker1')
                echo 'pulled image valipivenkatesh/venkatesh_jenkeins_docker1'
                sh('docker images')
            }
        }
        stage('start a container') {
            steps {
               sh '''if [ $(docker ps | awk \'{print $NF}\' | grep venkatesh-jenkins-container9) = \'venkatesh-jenkins-container9\' ]; then
                        docker stop "venkatesh-jenkins-container9"
                        docker rm "venkatesh-jenkins-container9"
                fi'''
                sh('docker run -it -d -p 8084:80 --name venkatesh-jenkins-container9 valipivenkatesh/venkatesh_jenkeins_docker1')
                sh('docker exec venkatesh-jenkins-container9 service nginx start')
            }
        }
    }
}
