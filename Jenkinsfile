pipeline {
  agent any

  tools {
    terraform 'terraform'
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-secret-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }

  stages {
    stage('Init Provider') {
      steps {
        bat 'terraform init'
      }
    }
    stage('Plan Resources') {
      steps {
        bat 'terraform plan'
      }
    }
    stage('Apply Resources') {
      input {
        message "Do you want to proceed for production deployment?"
      }
      steps {
        bat 'terraform apply -auto-approve'
      }
    }
    stage('Destroy Resources') {
      input {
        message "Do you want to destroy the infrastructure?"
      }
      steps {
        bat 'terraform destroy -auto-approve'
      }
    }
  }
}