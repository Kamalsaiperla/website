pipeline{
    /* specify nodes for executing */
    agent any
    stages{
        /* checkout repo */
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
	stage("Build image") {
            steps {
                script {
                    myapp = docker.build("gcr.io/rosy-petal-304002/sample_website:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://us.gcr.io', 'gcr:google-container-registry-project') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        } 
         stage('Do the deployment') {
            steps {
                echo ">> Run deploy applications "
            }
        }

    }
 
    /* Cleanup workspace */
    post {
       always {
           deleteDir()
       }
   }
}

/*pipeline {
    agent any
    environment {
        PROJECT_ID = 'rosy-petal-304002'
        CLUSTER_NAME = 'jenkins-cd'
        LOCATION = 'us-east1-d'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }

}
/*
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("DOCKER-HUB-USERNAME/hello:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }        
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/hello:latest/hello:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }    
}
*/
