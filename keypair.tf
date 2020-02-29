resource "aws_key_pair" "k8sKeyPair" {
  key_name   = "k8sKeyPair"
  public_key = file(var.K8S_PUB_KEY)
}