
podTemplate(
  name: 'build-pod',
  label: 'build-pod',
  containers: [
      // containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:latest',args: '${computer.jnlpmac} ${computer.name}', workingDir: '/home/jenkins'),
      containerTemplate(name: 'terraform', image: 'hashicorp/terraform:latest', ttyEnabled: true, command: 'cat', workingDir: '/home/jenkins'),
      containerTemplate(name: 'docker', image:'trion/jenkins-docker-client')
  ],
  envVars: [
      envVar(key:'TF_VAR_region', value:'us-phoenix-1'),
      envVar(key:'TF_VAR_default_compartment_id', value:'ocid1.compartment.oc1..aaaaaaaa4vxl6yyvfcumwutejntiu3tzcwacbpgdqndh3kct5i65ahvz7oma')

  ],
  volumes: [
      hostPathVolume(mountPath: '/var/run/docker.sock',hostPath: '/var/run/docker.sock')
      ]
  ){
    //node = the pod label
    node('build-pod'){
      stages{
        stage('Checkout') {
          parallel {
            stage('module'){
              checkout scm
            }
            stage('tests'){
            
              checkout poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'sdf-tf-core-subet-test']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/jeevanjoseph/sdf-tf-core-subet-test.git']]]
            }
          }
        }
        //container = the container label
        stage('Init & Plan') { 
          container('terraform') {
            withCredentials([string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_id'), 
                            string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_id'), 
                            string(credentialsId: 'fingerprint_jeevan', variable: 'TF_VAR_fingerprint'), 
                            file(credentialsId: 'api_key', variable: 'TF_VAR_private_key_path')] 
                            ) {
              sh 'env|grep TF_VAR'
              sh 'ls -altr'
              sh 'terraform version'
              sh 'terraform init examples/simple'
              sh 'terraform plan -out examples/simple/myplan examples/simple'
            }
          }   
        }
        stage('Approval') {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
        stage('Apply') {
          container('terraform') {
            withCredentials([string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_id'), 
                            string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_id'), 
                            string(credentialsId: 'fingerprint_jeevan', variable: 'TF_VAR_fingerprint'), 
                            file(credentialsId: 'api_key', variable: 'TF_VAR_private_key_path')]) {
              sh 'terraform apply -input=false examples/simple/myplan'
            }
          }
        }
        stage('Approval') {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
        stage('Destroy') {
          container('terraform') {
            withCredentials([string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_id'), 
                            string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_id'), 
                            string(credentialsId: 'fingerprint_jeevan', variable: 'TF_VAR_fingerprint'), 
                            file(credentialsId: 'api_key', variable: 'TF_VAR_private_key_path')]) {
              sh 'terraform destroy -auto-approve examples/simple'
            }
          }
        }
      }

    }
  }



