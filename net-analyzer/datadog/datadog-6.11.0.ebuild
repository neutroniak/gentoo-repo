# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/DataDog/datadog-agent/..."

EGO_VENDOR=(
"github.com/DataDog/datadog-agent ${PV}"
"github.com/DataDog/integrations-core ${PV}"
"github.com/DataDog/agent-payload 4.7.1"
"github.com/DataDog/gohai master"
"github.com/DataDog/zstd v1.3.0"
"github.com/Microsoft/go-winio v0.4.7"
"github.com/hashicorp/consul v1.0.0"
"github.com/beevik/ntp cb3dae3a7588ae35829eb5724df611cd75152fba"
"github.com/cihub/seelog v2.6"
"github.com/coreos/etcd v3.2.0"
"github.com/docker/docker v1.13.1"
"github.com/containerd/containerd v1.2.2" 
"github.com/gogo/protobuf v1.0.0"
"github.com/kubernetes/apimachinery release-1.11"
"github.com/kubernetes/client-go release-8.0"
"github.com/kubernetes/api release-1.11"
"github.com/kubernetes/apiserver release-1.11"
"github.com/kubernetes/metrics release-1.11"
"github.com/kubernetes-incubator/custom-metrics-apiserver 85ebc283a57287a8fcb3ad4b488d633cd63ef7d8"
"github.com/gorilla/mux v1.6.1"
"github.com/mholt/archiver 26cf5bb32d07aa4e8d0de15f56ce516f4641d7df"
"github.com/kardianos/osext ae77be60afb1dcacde03767a8c37337fad28ac14"
"github.com/mitchellh/reflectwalk 63d60e9d0dbc60cf9164e6510889b0db6683d98c"
"github.com/patrickmn/go-cache v2.1.0"
"github.com/sbinet/go-python master"
"github.com/shirou/gopsutil v2.18.12"
"github.com/spf13/cobra v0.0.1"
"github.com/json-iterator/go 1.1.4"
"github.com/DataDog/viper v1.5.0"
"github.com/coreos/go-systemd v16"
"github.com/stretchr/testify v1.2.1"
"github.com/go-yaml/yaml d670f9405373e636a5a2765eea47fac0c9bc91a4"
"github.com/zorkian/go-datadog-api v2.12.0"
"github.com/aws/aws-sdk-go v1.12.74"
"github.com/lxn/win 7e1250ba2e7749fb9eb865da9ee93fb5a2fe73f1"
"github.com/StackExchange/wmi 5d049714c4a64225c3c79a7cf7d02f7fb5b96338"
"github.com/jhoonb/archivex be4efa7ec0c38ab76d56037014c90d48d6b13037"
"github.com/ugorji/go 8c0409fcbb70099c748d71f714529204975f6c3f"
"github.com/clbanning/mxj v1.8"
"github.com/docker/distribution 83389a148052d74ac602f5f1d62f86ff2f3c4aa5"
"github.com/adjust/goautoneg master"
"github.com/spf13/cast 1ee8c8bd14a3d768a7ff681617ed56bc6c204940"
"github.com/DataDog/mmh3 master"
"github.com/modern-go/reflect2 v1.0.1"
"github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
"github.com/adjust/goautoneg d788f35a0315672bc90f50a6145d1252a230ee0d"
"github.com/dsnet/compress master"
"github.com/fatih/color v1.7.0"
"github.com/dustin/go-humanize 9f541cc9db5d55bce703bd99987c9d5cb8eea45e"
"github.com/go-ini/ini 06f5f3d67269ccec1fe5fe4134ba6e982984f7f5"
"github.com/golang/snappy 2e65f85255dbc3072edf28d6b5b8efc472979f5a"
"github.com/nwaples/rardecode e06696f847aeda6f39a8f0b7cdff193b7690aef6"
"github.com/pierrec/lz4 1958fd8fff7f115e79725b1288e0b878b3e06b00"
"github.com/spf13/afero 787d034dfe70e44075ccc060d346146ef53270ad"
"github.com/spf13/cast 1ee8c8bd14a3d768a7ff681617ed56bc6c204940"
"github.com/spf13/cobra ef82de70bb3f60c65fb8eebacbb2d122ef517385"
"github.com/spf13/pflag 583c0c0531f06d5278b7d917446061adc344b5cd"
"github.com/spf13/viper v1.3.2"
"github.com/ulikunitz/xz 0c6b41e72360850ca4f98dc341fd999726ea007f"
"github.com/urfave/negroni 5dbbc83f748fc3ad38585842b0aedab546d0ea1e"
"golang.org/x/text f21a4dfb5e38f5895301dc265a8def02365cc3d0 github.com/golang/text"
"github.com/fsnotify/fsnotify c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9"
"github.com/hashicorp/hcl ef8a98b0bbce4a65b5aa4c368430a80ddc533168"
"github.com/magiconair/properties c2353362d570a7bfa228149c62842019201cfb71"
"golang.org/x/sys 7138fd3d9dc8335c567ca206f4333fb75eb05d56 github.com/golang/sys"
"github.com/mitchellh/mapstructure bb74f1db0675b241733089d5a1faa5dd8b0ef57b"
"github.com/prometheus/client_golang c5b7fccd204277076155f10851dad72b76a49317"
"golang.org/x/net 97aa3a539ec716117a9d15a4659a911f50d13c3c github.com/golang/net"
"github.com/pelletier/go-toml c01d1270ff3e442a8a57cddc1c92dc1138598194"
"github.com/spf13/jwalterweatherman 7c0cea34c8ece3fbeb2b27ab9b59511d360fb394"
"gopkg.in/zorkian/go-datadog-api.v2 d7b8b10db6a7eb1c1c2424b10a795a1662e80c9a github.com/zorkian/go-datadog-api"
"github.com/prometheus/procfs 7d6f385de8bea29190f15ba9931442a0eaef9af7"
"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
"github.com/prometheus/common 89d80287644767070914e30199b4d959e491bd3d"
"gopkg.in/yaml.v2 d670f9405373e636a5a2765eea47fac0c9bc91a4 github.com/go-yaml/yaml"
"github.com/gogo/protobuf 1adfc126b41513cc696b209667c8656ea7aac67c"
"github.com/matttproud/golang_protobuf_extensions c12348ce28de40eed0136aa2b644d0ee0650e56c"
"github.com/prometheus/client_model 99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c"
"github.com/golang/protobuf b4deda0973fb4c70b50d226b1af49f3da59f5265"
"github.com/sbinet/go-python f976f61134dc6f5b4920941eb1b0e7cec7e4ef4c"
"k8s.io/apimachinery def12e63c512da17043b4f0293f52d1006603d9f github.com/kubernetes/apimachinery"
"github.com/DataDog/datadog-go e67964b4021ad3a334e748e8811eb3cd6becbc6e"
"github.com/tinylib/msgp af6442a0fcf6e2a1b824f70dd0c734f01e817751"
"github.com/philhofer/fwd bb6d471dc95d4fe11e432687f8b70ff496cf3136"
)

inherit user golang-base golang-build golang-vcs-snapshot

ARCHIVE_URI="https://github.com/DataDog/datadog-agent/archive/${PV}.tar.gz -> datadog-agent-${PV}.tar.gz
	${EGO_VENDOR_URI}
"

IUSE="-active_directory -activemq -activemq_xml -agent_metrics -apache -btrfs -cacti -cassandra -cassandra_nodetool -ceph -consul -couch -couchbase -directory +disk -dns_check -docker_daemon -elastic -envoy -etcd -fluentd -gearmand -gitlab -gitlab_runner -go_expvar -go-metro -gunicorn -haproxy -hdfs_datanode -hdfs_namenode -http_check -istio -kafka -kafka_consumer -kong -kube_dns -kubelet -kube_proxy -kubernetes -kubernetes_state -kyototycoon -lighttpd -linkerd +linux_proc_extras -mapreduce -marathon -mcache -mesos_master -mesos_slave -mongo -mysql -nagios +network -nfsstat -nginx +ntp -openstack -oracle -pdh_check -pgbouncer -php_fpm -postfix -postgres -powerdns_recursor +process -prometheus -rabbitmq -redisdb -riak -riakcs -snmp -solr -spark -squid -ssh_check -statsd -supervisord +system_core +system_swap -tasks +tcp_check -teamcity -tokumx -twemproxy -varnish -vsphere -yarn -zk"

DESCRIPTION="DataDog Agent v6"
HOMEPAGE="https://www.datadoghq.com"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/go-1.11.5
	dev-vcs/mercurial
	dev-python/pip
"

RDEPEND="${DEPEND}
	app-admin/sysstat
	sys-process/procps
	postfix? ( app-admin/sudo )
	snmp? ( net-analyzer/net-snmp )
"

JMXVERSION="0.27.0"

pkg_setup() {
	enewgroup dd-agent
	enewuser dd-agent -1 -1 /opt/datadog-agent dd-agent
}

src_prepare() {
	default
}

src_compile() {
	GOOS="Gentoo"
	GOARCH="x86-64"
	GOPATH="${S}" go build -a -race -o 'bin/agent' -tags '--build-include=apm cpython jmx log netcgo process zlib secrets' -tags '--build-exclude=systemd' 'github.com/DataDog/datadog-agent/cmd/agent'
	GOPATH="${S}" go generate 'github.com/DataDog/datadog-agent/cmd/agent'

	GOPATH="${S}" go build -a -race -o 'bin/dogstatsd' 'github.com/DataDog/datadog-agent/cmd/dogstatsd'
	GOPATH="${S}" go generate 'github.com/DataDog/datadog-agent/cmd/dogstatsd'

	#GOPATH="${S}" go build -race -o 'bin/dogstatsd' 'github.com/DataDog/datadog-agent/cmd/trace-agent'
	#GOPATH="${S}" go generate 'github.com/DataDog/datadog-agent/cmd/trace-agent'
}

src_install() {
	ebegin "Installing Datadog"
	DDROOT=${S}"/src/github.com/DataDog/datadog-agent"

	dodir /opt/datadog-agent/bin/agent
	insinto /opt/datadog-agent/bin/agent
	doins ${S}/bin/agent
	doins ${S}/bin/dogstatsd
	fperms 0755 /opt/datadog-agent/bin/agent/agent
	fperms 0755 /opt/datadog-agent/bin/agent/dogstatsd

	newinitd "${FILESDIR}"/datadog-agent.initd datadog-agent
	newconfd "${FILESDIR}"/datadog-agent.confd datadog-agent

	keepdir /etc/datadog-agent
	keepdir /etc/datadog-agent/conf.d
	insinto /etc/datadog-agent
	newins ${DDROOT}/cmd/agent/dist/datadog.yaml datadog.yaml.example
	newins ${DDROOT}/cmd/agent/dist/network-tracer.yaml network-tracer.yaml.example

	insinto /etc/datadog-agent/conf.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/cpu.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/io.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/jmx.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/load.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/memory.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/disk.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/ntp.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/uptime.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/network.d
	doins -r ${DDROOT}/cmd/agent/dist/conf.d/file_handle.d

	dodir /opt/datadog-agent/bin/agent/dist
	insinto /opt/datadog-agent/bin/agent/dist
	doins -r ${DDROOT}/cmd/agent/dist/checks
	doins -r ${DDROOT}/pkg/status/dist/templates
	#doins -r ${DDROOT}/cmd/agent/dist/utils
	#doins -r ${DDROOT}/cmd/agent/dist/views
	doins ${DDROOT}/cmd/agent/dist/config.py

	keepdir /var/log/datadog
	dodir /var/run/datadog
	fperms 0700 /var/log/datadog
	fperms 0700 /var/run/datadog
}

pkg_preinst() {
	dodir /opt/datadog-agent/bin/agent/dist/jmx
	insinto /opt/datadog-agent/bin/agent/dist/jmx

	wget https://dl.bintray.com/datadog/datadog-maven/com/datadoghq/jmxfetch/${JMXVERSION}/jmxfetch-${JMXVERSION}-jar-with-dependencies.jar
	newins jmxfetch-${JMXVERSION}-jar-with-dependencies.jar jmxfetch-${JMXVERSION}-jar-with-dependencies.jar  

	#integrations
	dodir /opt/datadog-agent/.local
	dosym /opt/datadog-agent/.local /opt/datadog-agent/embedded
	cd ${S}"/src/github.com/DataDog/datadog-agent/vendor/github.com/DataDog/integrations-core"

	pip install -r requirements-agent-release.txt --user

	pip install wheel --user
	pip install pympler --user

	DATADOG_INTEGRATIONS="$(usev active_directory) $(usev activemq) $(usev activemq_xml) $(usev agent_metrics) $(usev apache) $(usev btrfs) $(usev cacti) $(usev cassandra) $(usev cassandra_nodetool) $(usev ceph) $(usev consul) $(usev couch) $(usev couchbase) $(usev directory) $(usev disk) $(usev dns_check) $(usev docker_daemon) $(usev elastic) $(usev envoy) $(usev etcd) $(usev fluentd) $(usev gearmand) $(usev gitlab) $(usev gitlab_runner) $(usev go_expvar) $(usev go-metro) $(usev gunicorn) $(usev haproxy) $(usev hdfs_datanode) $(usev hdfs_namenode) $(usev http_check) $(usev istio) $(usev kafka) $(usev kafka_consumer) $(usev kong) $(usev kube_dns) $(usev kubelet) $(usev kube_proxy) $(usev kubernetes) $(usev kubernetes_state) $(usev kyototycoon) $(usev lighttpd) $(usev linkerd) $(usev linux_proc_extras) $(usev mapreduce) $(usev marathon) $(usev mcache) $(usev mesos_master) $(usev mesos_slave) $(usev mongo) $(usev mysql) $(usev nagios) $(usev network) $(usev nfsstat) $(usev nginx) $(usev ntp) $(usev openstack) $(usev oracle) $(usev pdh_check) $(usev pgbouncer) $(usev php_fpm) $(usev postfix) $(usev postgres) $(usev powerdns_recursor) $(usev process) $(usev prometheus) $(usev rabbitmq) $(usev redisdb) $(usev riak) $(usev riakcs) $(usev snmp) $(usev solr) $(usev spark) $(usev squid) $(usev ssh_check) $(usev statsd) $(usev supervisord) $(usev system_core) $(usev system_swap) $(usev tasks) $(usev tcp_check) $(usev teamcity) $(usev tokumx) $(usev twemproxy) $(usev varnish) $(usev vsphere) $(usev yarn) $(usev zk)"

	for integration in ${DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		pip install . --user
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

	insinto /opt/datadog-agent/.local
	doins -r $HOME/.local/*

	fowners -R dd-agent:dd-agent /etc/datadog-agent
	fowners -R dd-agent:dd-agent /opt/datadog-agent
	fowners -R dd-agent:dd-agent /var/log/datadog
	fowners -R dd-agent:dd-agent /var/run/datadog
}
