# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user git-r3

DESCRIPTION="DataDog Agent v6"
HOMEPAGE="https://www.datadoghq.com"
SRC_URI=""

EGIT_REPO_URI="https://github.com/DataDog/integrations-core"

EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="-active_directory -activemq -activemq_xml -agent_metrics -apache -btrfs -cacti -cassandra -cassandra_nodetool -ceph -consul -couch -couchbase -directory +disk -dns_check -docker_daemon -elastic -envoy -etcd -fluentd -gearmand -gitlab -gitlab_runner -go_expvar -go-metro -gunicorn -haproxy -hdfs_datanode -hdfs_namenode -http_check -istio -kafka -kafka_consumer -kong -kube_dns -kubelet -kube_proxy -kubernetes -kubernetes_state -kyototycoon -lighttpd -linkerd +linux_proc_extras -mapreduce -marathon -mcache -mesos_master -mesos_slave -mongo -mysql -nagios +network -nfsstat -nginx +ntp -openstack -oracle -pdh_check -pgbouncer -php_fpm -postfix -postgres -powerdns_recursor +process -prometheus -rabbitmq -redisdb -riak -riakcs -snmp -solr -spark -squid -ssh_check -statsd -supervisord +system_core +system_swap -tasks +tcp_check -teamcity -tokumx -twemproxy -varnish -vsphere -yarn -zk"

DEPEND="
	dev-python/pip
"

RDEPEND="${DEPEND}
	net-analyzer/datadog-agent
	postfix? ( app-admin/sudo )
	snmp? ( net-analyzer/net-snmp )
"

pkg_setup() {
	enewgroup dd-agent
	enewuser dd-agent -1 /bin/sh /opt/datadog-agent dd-agent
}

src_compile() {
	ebegin "Building integrations for datadog-agent"

	pip install -r requirements-dev.txt --user

	pip install wheel --user

	DATADOG_INTEGRATIONS="$(usev active_directory) $(usev activemq) $(usev activemq_xml) $(usev agent_metrics) $(usev apache) $(usev btrfs) $(usev cacti) $(usev cassandra) $(usev cassandra_nodetool) $(usev ceph) $(usev consul) $(usev couch) $(usev couchbase) $(usev directory) $(usev disk) $(usev dns_check) $(usev docker_daemon) $(usev elastic) $(usev envoy) $(usev etcd) $(usev fluentd) $(usev gearmand) $(usev gitlab) $(usev gitlab_runner) $(usev go_expvar) $(usev go-metro) $(usev gunicorn) $(usev haproxy) $(usev hdfs_datanode) $(usev hdfs_namenode) $(usev http_check) $(usev istio) $(usev kafka) $(usev kafka_consumer) $(usev kong) $(usev kube_dns) $(usev kubelet) $(usev kube_proxy) $(usev kubernetes) $(usev kubernetes_state) $(usev kyototycoon) $(usev lighttpd) $(usev linkerd) $(usev linux_proc_extras) $(usev mapreduce) $(usev marathon) $(usev mcache) $(usev mesos_master) $(usev mesos_slave) $(usev mongo) $(usev mysql) $(usev nagios) $(usev network) $(usev nfsstat) $(usev nginx) $(usev ntp) $(usev openstack) $(usev oracle) $(usev pdh_check) $(usev pgbouncer) $(usev php_fpm) $(usev postfix) $(usev postgres) $(usev powerdns_recursor) $(usev process) $(usev prometheus) $(usev rabbitmq) $(usev redisdb) $(usev riak) $(usev riakcs) $(usev snmp) $(usev solr) $(usev spark) $(usev squid) $(usev ssh_check) $(usev statsd) $(usev supervisord) $(usev system_core) $(usev system_swap) $(usev tasks) $(usev tcp_check) $(usev teamcity) $(usev tokumx) $(usev twemproxy) $(usev varnish) $(usev vsphere) $(usev yarn) $(usev zk)"

	for integration in ${DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		pip install . --user
		cd ..
	done
}

src_install() {
	ebegin "Installing datadog-integrations-core"

	keepdir /opt/datadog-agent/.local
	dosym /opt/datadog-agent/.local /opt/datadog-agent/embedded

	insinto /opt/datadog-agent/.local

	doins -r $HOME/.local/*
	
	for integration in ${DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		dodir /etc/datadog-agent/conf.d/${integration}.d
		insinto /etc/datadog-agent/conf.d/${integration}.d

		if [ -f metrics.yaml ]; then
			newins metrics.yaml metrics.yaml.example
		fi
		if [ -f conf.yaml.example ]; then
			doins conf.yaml.example
		fi
		if [ -f conf.yaml.default ]; then
			doins conf.yaml.default
		fi
		cd ..
	done

	fowners -R dd-agent:dd-agent /opt/datadog-agent
	fowners -R dd-agent:dd-agent /etc/datadog-agent
}
