node 'ld07677' {
  include role::kubernetes::master
}

node /^kube-replica-master/ {
  include role::kubernetes::controller
}

node /^kube-node/  {
  include role::kubernetes::worker
}

node lb {}
