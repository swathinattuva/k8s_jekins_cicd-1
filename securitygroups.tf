
resource "aws_security_group" "master-sg" {
  vpc_id      = var.VPCID
  name        = "masterSG"
  description = "Security group for Kubernetes Master Node."
  tags = {
    Name = "masterSG"
  }
}

resource "aws_security_group" "worker-sg" {
  vpc_id      = var.VPCID
  name        = "workerSG"
  description = "Security group for Kubernetes worker nodes."
  tags = {
    Name = "workerSG"
  }
}

########################
#      Inbound Rules   #
########################
resource "aws_security_group_rule" "masterAllowSSH" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.master-sg.id
}

resource "aws_security_group_rule" "workerAllowSSH" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.worker-sg.id
}

########################
#      Inbound Rules   #
########################

#@@@@@@@@@@@@@@@@@@@@@@@

########################
#      Outbound Rules   #
########################

resource "aws_security_group_rule" "masterOutboundtoAll" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.master-sg.id
}

resource "aws_security_group_rule" "workerOutboundtoAll" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.worker-sg.id
}

########################
#      Outbound Rules  #
########################