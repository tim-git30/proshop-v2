pipeline {
    agent any

    stages {
        stage('Informations') {
            steps {
                echo '===== Informations ====='
                sh 'pwd && ls -la'
            }
        }
        stage('Docker Test') {
            steps {
                echo '===== Verification Docker ====='
                sh 'docker --version && docker ps'
            }
        }
        stage('Build Backend') {
            steps {
                echo '===== Build Backend ====='
                sh 'docker build -t proshop-backend:latest -f backend/Dockerfile .'
            }
        }
        stage('Build Frontend') {
            steps {
                echo '===== Build Frontend ====='
                sh 'docker build -t proshop-frontend:latest frontend/'
            }
        }
        stage('Deploy') {
            steps {
                echo '===== Deploiement ====='
                sh '''
                docker-compose down || true
                docker-compose up -d
                '''
            }
        }
        stage('Verify') {
            steps {
                echo '===== Verification ====='
                sh '''
                docker ps
                echo "--- Statut des services Compose ---"
                docker-compose ps
                '''
            }
        }
    }
    post {
        success {
            echo '===================================='
            echo 'PIPELINE EXECUTE AVEC SUCCES'
            echo '===================================='
            echo 'Frontend : http://localhost:8080'
            echo 'Backend  : http://localhost:5000'
            echo 'MongoDB  : localhost:27017'
        }
        failure {
            echo '===================================='
            echo 'ECHEC DU PIPELINE'
            echo '===================================='
        }
    }
}