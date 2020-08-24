pipeline {

    agent any 
    stages {
        stage('Git') { 
            steps {
                echo 'Downloading Git Repo...'
                git 'https://github.com/exilemirror/react-eks.git'
            }
        }
        stage('Build') { 
            steps {
                echo 'Build React App'
                sh 'docker build -t exilemirror/app-prod -f Dockerfile .' 
            }
        }
        stage('Test') { 
            steps {
                echo 'Test React App'
                sh 'docker-compose up --build'
            }
        }
        stage('Push to Docker Hub') { 
            steps {
                echo '"$dockerPwd" | docker login -u "dockerId" --password-stdin'
                sh 'docker push exilemirror/app-prod'              
            }
        }
    }
}