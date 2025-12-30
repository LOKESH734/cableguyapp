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
               sh 'echo "Biulding happnes"'
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