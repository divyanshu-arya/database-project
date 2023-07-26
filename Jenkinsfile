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
                deploy adapters: [tomcat9(credentialsId: 'Tomcat9', path: '', url: 'http://13.126.17.134:8080')], contextPath:  'http://13.126.17.134:8080/LoginWebApp', onFailure: false, war: '**/*.war'
            }
        }
    }
}
