
podTemplate(
  name: 'build-pod',
  label: 'build-pod',
  containers: [
      // containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:latest',args: '${computer.jnlpmac} ${computer.name}', workingDir: '/home/jenkins'),
      containerTemplate(name: 'terraform', image: 'hashicorp/terraform:latest', ttyEnabled: true, command: 'cat', workingDir: '/home/jenkins'),
      containerTemplate(name: 'golang', image: 'golang:latest', ttyEnabled: true, command: 'cat', workingDir: '/home/jenkins'),
      containerTemplate(name: 'docker', image:'trion/jenkins-docker-client')
  ],
  envVars: [
      envVar(key:'TF_VAR_region', value:'us-phoenix-1'),
      envVar(key:'OCI_GO_SDK_DEBUG', value:'debug'),
      envVar(key:'TF_VAR_default_compartment_id', value:'ocid1.compartment.oc1..aaaaaaaa4vxl6yyvfcumwutejntiu3tzcwacbpgdqndh3kct5i65ahvz7oma'),
      envVar(key:'TF_VAR_compartment_id', value:'ocid1.compartment.oc1..aaaaaaaa4vxl6yyvfcumwutejntiu3tzcwacbpgdqndh3kct5i65ahvz7oma'),
      // envVar(key:'TF_VAR_compartment_ocid', value:'ocid1.compartment.oc1..aaaaaaaa4vxl6yyvfcumwutejntiu3tzcwacbpgdqndh3kct5i65ahvz7oma'),
      envVar(key:'GOPATH', value:'/home/jenkins/workspace/sdf-core-subnet_master/sdf-tf-core-subet-test/')

  ],
  volumes: [
      hostPathVolume(mountPath: '/var/run/docker.sock',hostPath: '/var/run/docker.sock')
      ]
  ){
    //node = the pod label
    node('build-pod'){
      stage('Checkout') {
        checkout poll: false, 
                 scm: [$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'RelativeTargetDirectory', 
                      relativeTargetDir: 'sdf-core-subnet']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/jeevanjoseph/sdf-core-subnet.git']]]
        checkout poll: false,  
                 scm: [$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'RelativeTargetDirectory', 
                      relativeTargetDir: 'sdf-tf-core-subet-test']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/jeevanjoseph/sdf-tf-core-subet-test.git']]]
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
            sh 'terraform init sdf-core-subnet/examples/simple'
            sh 'terraform plan -out sdf-core-subnet/examples/simple/myplan sdf-core-subnet/examples/simple'
          }
        }   
      }

      stage('Terratest') {
        container('golang') {
          withCredentials([string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_id'),
                           string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_ocid'), 
                           string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_id'), 
                           string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_ocid'), 
                           string(credentialsId: 'fingerprint_jeevan', variable: 'TF_VAR_fingerprint'), 
                           file(credentialsId: 'api_key', variable: 'TF_VAR_private_key_path')]) {
            dir('sdf-tf-core-subet-test/Simple_test') {
              sh 'ls -altr '
              sh 'env|grep TF_VAR'
              sh 'pwd'
              sh 'go version'
              sh 'go get -v github.com/oracle/oci-go-sdk/core'
              sh 'go get -v github.com/oracle/oci-go-sdk/common'
              sh 'go get -v github.com/gruntwork-io/terratest/modules/terraform'
              sh 'go get -v github.com/stretchr/testify/assert'
              sh 'apt-get update && apt-get install -y \
                    unzip \
                    && rm -rf /var/lib/apt/lists/*'
              sh 'curl -L -s https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip -o /go/bin/terraform.zip \
                    && unzip /go/bin/terraform.zip -d /go/bin \
                    && chmod +x /go/bin/terraform'
              sh 'go test -v -run TestSimple'
              sh 'ls -altr '

            }
            
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
            sh 'terraform apply -input=false sdf-core-subnet/examples/simple/myplan'
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
            sh 'terraform destroy -auto-approve sdf-core-subnet/examples/simple'
          }
        }
      }

    }
  }



