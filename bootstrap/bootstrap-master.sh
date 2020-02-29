#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Initialize Kubernetes Cluster"
sudo su - root -c "kubeadm init --kubernetes-version=1.15.3 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null"

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to centos user .kube directory"
sudo su - root -c "mkdir /home/centos/.kube"
sudo su - root -c "cp /etc/kubernetes/admin.conf /home/centos/.kube/config"
sudo su - root -c "chown -R centos:centos /home/centos/.kube"

# Deploy calico network
echo "[TASK 3] Deploy calico network"
sudo su - root -c "yum install wget -y"
cd /home/centos && wget https://raw.githubusercontent.com/PrasadTelasula/k8s_calico/master/calico.yaml
kubectl create -f /home/centos/calico.yaml

# Generate Cluster join command
echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
sudo su - root -c kubeadm token create --print-join-command > /joincluster.sh"
sudo su - root -c "cat /joincluster.sh"
