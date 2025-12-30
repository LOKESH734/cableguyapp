pipeline{
    agent any
    {
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
               sh 'Echo "Biulding happnes"'
            }
        }
        stage('Test')
        {
            steps{
                sh 'echo "Testing"'  
            }
        }

    }
}
}