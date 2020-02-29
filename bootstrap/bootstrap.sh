# Install docker from Docker-ce repository
echo "[TASK 1] Install docker container engine"
sudo su - root -c "yum install wget vim git -y"
sudo su - root -c "yum install -y -q yum-utils device-mapper-persistent-data lvm2 > /dev/null 2>&1"
sudo su - root -c "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo > /dev/null 2>&1"
sudo su - root -c "yum install -y -q docker-ce >/dev/null 2>&1"

# Enable docker service
echo "[TASK 2] Enable and start docker service"
sudo su - root -c "systemctl enable docker >/dev/null 2>&1"
sudo su - root -c "systemctl start docker"

# Disable SELinux
echo "[TASK 3] Disable SELinux"
sudo su - root -c "setenforce 0"
sudo su - root -c "sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux"

# Stop and disable firewalld
echo "[TASK 4] Stop and Disable firewalld"
sudo su - root -c "systemctl disable firewalld >/dev/null 2>&1"
sudo su - root -c "systemctl stop firewalld"

# Add sysctl settings
echo "[TASK 5] Add sysctl settings"
sudo su - root -c "cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF"
sudo su - root -c "sysctl --system >/dev/null 2>&1"



# Disable swap
echo "[TASK 6] Disable and turn off SWAP"
sudo su - root -c "sed -i '/swap/d' /etc/fstab"
sudo su - root -c "swapoff -a"

# Add yum repo file for Kubernetes
echo "[TASK 7] Add yum repo file for kubernetes"
sudo su - root -c "cat >>/etc/yum.repos.d/kubernetes.repo<<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF"

# Install Kubernetes
echo "[TASK 8] Install Kubernetes (kubeadm, kubelet and kubectl)"
sudo su - root -c "yum install -y -q kubeadm-1.15.3 kubelet-1.15.3 kubectl-1.15.3 >/dev/null 2>&1"

# Start and Enable kubelet service
echo "[TASK 9] Enable and start kubelet service"
sudo su - root -c "systemctl enable kubelet >/dev/null 2>&1"
sudo su - root -c "systemctl start kubelet >/dev/null 2>&1"

