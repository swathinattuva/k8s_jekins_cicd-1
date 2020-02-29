#!/bin/bash

# Initialize Kubernetes
sudo su -
echo "[TASK 1] Initialize Kubernetes Cluster"
sudo kubeadm init --kubernetes-version=1.15.3 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to centos user .kube directory"
mkdir /home/centos/.kube
cp /etc/kubernetes/admin.conf /home/centos/.kube/config
chown -R centos:centos /home/centos/.kube

# Deploy calico network
echo "[TASK 3] Deploy calico network"
yum install wget -y
su - centos -c "cd /home/centos && wget https://raw.githubusercontent.com/PrasadTelasula/k8s_calico/master/calico.yaml"
su - centos -c "kubectl create -f /home/centos/calico.yaml"

# Generate Cluster join command
echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh
