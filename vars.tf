variable "AWS_REGION" {
  default = "us-east-2"
}

variable "K8S_AMI_ID" {
  default = "ami-0a4e0492247630fe1"
}

variable "SUBNETID" {
  default = "subnet-0df3fe77211a23da5"
}

variable "VPCID" {
  default = "vpc-0a8ed174002b0f078"
}

variable "K8S_PRIV_KEY" {
  default = "keys/k8sLaunchKey"
}

variable "K8S_PUB_KEY" {
  default = "keys/k8sLaunchKey.pub"
}
