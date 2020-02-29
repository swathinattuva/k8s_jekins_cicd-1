variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "K8S_AMI_ID" {
  default = "ami-02e60be79e78fef21"
}

variable "SUBNETID" {
  default = "subnet-588a5131"
}

variable "VPCID" {
  default = "vpc-2000df49"
}

variable "K8S_PRIV_KEY" {
  default = "keys/k8sLaunchKey"
}

variable "K8S_PUB_KEY" {
  default = "keys/k8sLaunchKey.pub"
}