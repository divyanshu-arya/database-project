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
		    withSonarQubeEnv() {
      				sh "usr/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=Jenkins-SonarQube -Dsonar.projectName='Jenkins-SonarQube'"
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
