variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "K8S_AMI_ID" {
  default = "ami-02e60be79e78fef21"
}

variable "SUBNETID" {
  default = "subnet-9b2b1df3"
}

variable "VPCID" {
  default = "vpc-4e353c26"
}

variable "K8S_PRIV_KEY" {
  default = "keys/k8sLaunchKey"
}

variable "K8S_PUB_KEY" {
  default = "keys/k8sLaunchKey.pub"
}
