pipeline {
    agent any
    stages {
        stage('nodemodule') {
            agent {
              	docker {
                	image 'node:16.17.1-alpine'
                }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}