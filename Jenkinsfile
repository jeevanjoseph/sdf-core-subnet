
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
      envVar(key:'TF_VAR_default_compartment_id', value:'ocid1.compartment.oc1..aaaaaaaa4vxl6yyvfcumwutejntiu3tzcwacbpgdqndh3kct5i65ahvz7oma'),
      envVar(key:'TF_VAR_private_key_path', value:'../../creds/api_key.pem')

  ],
  volumes: [
      hostPathVolume(mountPath: '/var/run/docker.sock',hostPath: '/var/run/docker.sock')
      ]
  ){
    //node = the pod label
    node('build-pod'){
      stage('Checkout') {
        checkout scm
      }
      //container = the container label
      stage('Test Example-simple') { 
        container('terraform') {
          withCredentials([string(credentialsId: 'tenancy_ocid', variable: 'TF_VAR_tenancy_id'), string(credentialsId: 'user_ocid_jeevan', variable: 'TF_VAR_user_id'), string(credentialsId: 'fingerprint_jeevan', variable: 'TF_VAR_fingerprint'), file(credentialsId: 'api_key', variable: 'api_key_oci')]) {
            sh 'mkdir creds && echo ${api_key_oci} > ./creds/api_key.pem && cat ./creds/api_key.pem && chmod 700 ./creds/api_key.pem'
            sh 'env'
            sh 'ls -ltr'
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
      stage('TF Apply') {
        container('terraform') {
          sh 'terraform apply -input=false examples/simple/myplan'
        }
      }
    }
  }



