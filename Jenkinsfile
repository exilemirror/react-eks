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
                echo 'Building React App'
                sh 'docker build -t exilemirror/app-prod -f Dockerfile .' 
            }
        }
        stage('Test') { 
            steps {
                echo 'Testing React App'
                sh 'docker-compose up --build'
            }
        }
        stage('Deploy') { 
            steps {
                echo '"$dockerPwd" | docker login -u "dockerId" --password-stdin'
                sh 'docker push exilemirror/app-prod'              
            }
        }
    }
}