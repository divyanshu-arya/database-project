pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                checkout scm
            }
        }
        
        stage('SonarQubeScan') {
            steps {
		    withSonarQubeEnv( 'SonarQube Server' ) {
                    sh "/usr/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=database-project -Dsonar.projectName='database-project'"
                    }    
	}
        }
        
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean package"
            }
        }
        
        stage('Deploy') {
            steps {
                sh "cp target/LoginWebApp.war /home/ec2-user/apache-tomcat-9.0.78/webapps"
            }
        }
    }
}
