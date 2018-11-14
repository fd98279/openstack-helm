# Clone repos
set -xe
git clone https://git.openstack.org/openstack/openstack-helm-infra.git
git clone https://git.openstack.org/openstack/openstack-helm.git

# Begin install
cd openstack-helm
./tools/deployment/developer/common/010-deploy-k8s.sh
./tools/deployment/developer/common/020-setup-client.sh
./tools/deployment/developer/common/030-ingress.sh
./tools/deployment/developer/ceph/040-ceph.sh
./tools/deployment/developer/ceph/045-ceph-ns-activate.sh
./tools/deployment/developer/ceph/050-mariadb.sh
./tools/deployment/developer/ceph/060-rabbitmq.sh
./tools/deployment/developer/ceph/070-memcached.sh
./tools/deployment/developer/ceph/080-keystone.sh
./tools/deployment/developer/ceph/090-heat.sh
./tools/deployment/developer/ceph/100-horizon.sh
./tools/deployment/developer/ceph/110-ceph-radosgateway.sh
./tools/deployment/developer/ceph/120-glance.sh
./tools/deployment/developer/ceph/130-cinder.sh
./tools/deployment/developer/ceph/140-openvswitch.sh
./tools/deployment/developer/ceph/150-libvirt.sh
./tools/deployment/developer/ceph/160-compute-kit.sh
./tools/deployment/developer/ceph/170-setup-gateway.sh

# Test
./tools/deployment/developer/common/900-use-it.sh

# Verify openstack cli
# more /etc/openstack/clouds.yaml
export OS_CLOUD=openstack_helm
openstack stack list
openstack cinder list
openstack volume list