# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN="github.com/DataDog/datadog-agent/..."

inherit go-module

IUSE="-active_directory -activemq -activemq_xml -agent_metrics -apache -btrfs -cacti -cassandra -cassandra_nodetool -ceph -consul -couch -couchbase -directory +disk -dns_check -docker_daemon -elastic -envoy -etcd -fluentd -gearmand -gitlab -gitlab_runner -go_expvar -go-metro -gunicorn -haproxy -hdfs_datanode -hdfs_namenode -http_check -istio -kafka -kafka_consumer -kong -kube_dns -kubelet -kube_proxy -kubernetes -kubernetes_state -kyototycoon -lighttpd -linkerd +linux_proc_extras -mapreduce -marathon -mcache -mesos_master -mesos_slave -mongo -mysql -nagios +network -nfsstat -nginx +ntp -openstack -oracle -pdh_check -pgbouncer -php_fpm -postfix -postgres -powerdns_recursor +process -prometheus -rabbitmq -redisdb -riak -riakcs -snmp -solr -spark -squid -ssh_check -statsd -supervisord +system_core +system_swap -tasks +tcp_check -teamcity -tokumx -twemproxy -varnish -vsphere -yarn -zk"

DESCRIPTION="DataDog Agent v7"
HOMEPAGE="https://www.datadoghq.com"
SRC_URI="https://github.com/DataDog/datadog-agent/archive/${PV}.tar.gz -> datadog-agent-${PV}.tar.gz
	http://mrgz.org/${P}-deps.tar.xz"

LICENSE="Apache-2.0 MIT BSD MPL-2.0 BSD-2 ISC imagemagick"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=">=dev-lang/go-1.21
"

RDEPEND="${DEPEND}
"

S="${WORKDIR}/datadog-agent-${PV}"

src_compile() {
	ego build \
		-mod=readonly \
		-ldflags "${go_ldflags}" \
		-work -o "bin/${PN}" ./ || die
}

