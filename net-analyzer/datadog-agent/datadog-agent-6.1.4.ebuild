# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user git-r3

DESCRIPTION="DataDog Agent v6"
HOMEPAGE="https://www.datadoghq.com"
SRC_URI=""

EGIT_REPO_URI="https://github.com/DataDog/datadog-agent"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go
	dev-python/pip
"

RDEPEND="${DEPEND}"

_DEST=${HOME}/go/src/github.com/DataDog

pkg_setup() {
	enewgroup dd-agent
	enewuser dd-agent -1 /bin/sh /opt/datadog-agent dd-agent
}

src_compile() {
	ebegin "Building datadog-agent ${PV} at ${HOME}"
	mkdir -p ${_DEST}
	export GOPATH=${HOME}/go
	cp -r "${WORKDIR}/${P}" "${_DEST}/${PN}"
	pip install invoke==0.22.1 --user
	export PATH=$PATH:$HOME/.local/bin/:$HOME/go/bin
	cd ${_DEST}/${PN}
	invoke deps
	invoke agent.build --rebuild --build-exclude=snmp
}

src_install() {
	ebegin "Installing datadog-agent"
	newinitd "${FILESDIR}"/datadog-agent.initd datadog-agent
	newconfd "${FILESDIR}"/datadog-agent.confd datadog-agent

	keepdir /etc/datadog-agent
	insinto /etc/datadog-agent
	doins -r ${_DEST}/${PN}/bin/agent/dist/*

	dodir /opt/datadog-agent/bin
	dodir /opt/datadog-agent/licenses
	dodir /opt/datadog-agent/.local
	dosym /opt/datadog-agent/.local /opt/datadog-agent/embedded

	insinto /opt/datadog-agent/bin
	doins -r ${_DEST}/${PN}/bin/*

	fperms 0755 /opt/datadog-agent/bin/agent/agent

	keepdir /var/log/datadog
	fperms 0700 /var/log/datadog

	fowners -R dd-agent:dd-agent /etc/datadog-agent
	fowners -R dd-agent:dd-agent /opt/datadog-agent
	fowners -R dd-agent:dd-agent /var/log/datadog
}
