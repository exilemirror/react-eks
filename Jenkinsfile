pipeline {
    environment { 
        registry = "exilemirror/react-eks" 
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }
    agent any 
    stages {
        stage('Git') { 
            steps {
                echo 'Downloading Git Repo...'
                git 'https://github.com/exilemirror/react-eks.git'
            }
        }
        stage('Building') { 
            steps { 
                echo 'Building React App...'
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Test') { 
            steps {
                echo 'Test React App'
                //sh 'docker-compose up --build'
            }
        }
        stage('Push to Docker Hub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
    }
}