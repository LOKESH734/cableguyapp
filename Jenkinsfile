pipeline{
    agent {
        docker{
            image:'node:18-alpine'
            reuseNode true
        }
    }
    
        stages{
            stage('Checkout')
            {
                steps{
                    checkout scm
                }
            }
            stage('Build')
        {
            steps{
               sh '''
               npm --version
               node --version
               npm install ||true
               echo "Biulding happnes"
               '''
            }
        }
        stage('Test')
        {
            steps{
                sh 'echo "Testing"'  
                sh 'exit 1'
            }
        }

    }

    post{
        always{
            echo 'This will always run after the stages finish'
        }
        success{
            echo 'This will run only if the pipeline succeeds'
        }
        failure{
            echo 'This will run only if the pipeline fails'
        }
    
}
}