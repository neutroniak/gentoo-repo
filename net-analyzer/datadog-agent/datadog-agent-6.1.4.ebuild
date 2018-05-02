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

src_compile() {
	ebegin "Building datadog-agent ${PV} at ${HOME}"
	mkdir -p ${_DEST}
	export GOPATH=${HOME}/go
	cp -r ${WORKDIR}/${P} ${_DEST}/${PN}
	pip install invoke==0.22.1 --user
	export PATH=$PATH:$HOME/.local/bin/:$HOME/go/bin
	cd ${_DEST}/${PN}
	invoke deps
	invoke agent.build --build-exclude=snmp
}

src_install() {
	ebegin "Installing datadog-agent"
	newbin ${_DEST}/${PN}/bin/agent/agent datadog-agent
	newinitd "${FILESDIR}"/datadog-agent.initd datadog-agent
	newconfd "${FILESDIR}"/datadog-agent.confd datadog-agent

	keepdir /etc/datadog-agent
	insinto /etc/datadog-agent
	doins ${_DEST}/${PN}/bin/agent/dist/datadog.yaml

}
