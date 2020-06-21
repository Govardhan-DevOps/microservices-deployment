#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update && sudo apt install docker-ce

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update

sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00

sudo apt-mark hold kubelet kubeadm kubectl

For the later versions we have to disable the swap using swapoff command.
https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.8.md#before-upgrading

	sudo kubeadm init --pod-network-cidr=172.17.0.1/16 --apiserver-advertise-address=3.235.184.238 --kubernetes-version=v1.12.1
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubeadm join 3.235.184.238:6443 --token 88an59.vhk0wj63wfezdczo --discovery-token-ca-cert-hash sha256:51be190a663c4dbe05b9d3e2b48b76f3cb087b946ed196a5759a25ce6f4c5de8
	
  




