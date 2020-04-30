variable "AWS_REGION" {
  default = "us-east-2"
}

variable "K8S_AMI_ID" {
  default = "ami-0a4e0492247630fe1"
}

variable "SUBNETID" {
  default = "subnet-08615195c3a5e1f73"
}

variable "VPCID" {
  default = "vpc-079de7b712d9f9863"
}

variable "K8S_PRIV_KEY" {
  default = "keys/k8sLaunchKey"
}

variable "K8S_PUB_KEY" {
  default = "keys/k8sLaunchKey.pub"
}
