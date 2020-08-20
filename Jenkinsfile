pipeline {
    agent any 
    tools {nodejs "node"}
    stages {
        stage('Git') { 
            steps {
                echo 'Downloading Git Repo...'
                git 'https://github.com/exilemirror/react-eks.git'
            }
        }
        stage('Build') { 
            steps {
                echo 'Building...'
                sh 'ls -l | grep -i docker' 
            }
        }
        stage('Test') { 
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') { 
            steps {
                echo 'Deploying...' 
            }
        }
    }
}