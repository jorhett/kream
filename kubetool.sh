#!/bin/bash -ex

# Remove old docker image
if docker images | grep -w puppet/kubetool; then 
	docker rmi puppet/kubetool 
fi 

# Create hiera file
docker run --rm -v $(pwd):/mnt -e OS=redhat -e VERSION=1.9.2 -e CONTAINER_RUNTIME=docker -e CNI_PROVIDER=weave -e FQDN=ld07519.homedepot.com -e IP=10.16.33.141 -e BOOTSTRAP_CONTROLLER_IP=10.16.33.141 -e ETCD_INITIAL_CLUSTER="etcd-ld07677=http://10.16.33.141:2380" -e ETCD_IP=10.16.33.141 -e KUBE_API_ADVERTISE_ADDRESS=10.16.33.141 -e INSTALL_DASHBOARD=true puppet/kubetool

