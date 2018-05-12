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

IUSE=""

DEPEND="
	dev-python/pip
"

RDEPEND="${DEPEND}
	net-analyzer/datadog-agent
"

IUSE_DATADOG_INTEGRATIONS="
	system_core
	disk
	network
	process
"

pkg_setup() {
	enewgroup dd-agent
	enewuser dd-agent -1 /bin/sh /opt/datadog-agent dd-agent
}

src_compile() {
	ebegin "Building integrations for datadog-agent"

	pip install -r requirements-dev.txt --user

	for integration in ${IUSE_DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		pip install . --user
		cd ..
	done
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

	for integration in ${IUSE_DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		dodir /etc/datadog-agent/conf.d/${integration}.d
		insinto /etc/datadog-agent/conf.d/${integration}.d

		if [ -f conf.yaml.example ]; then
			doins conf.yaml.example
		fi
		if [ -f conf.yaml.default ]; then
			doins conf.yaml.default
		fi
		cd ..
	done
	for integration in ${DATADOG_INTEGRATIONS}; do
		elog "Entering directory $integration"
		cd $integration
		dodir /etc/datadog-agent/conf.d/${integration}.d
		insinto /etc/datadog-agent/conf.d/${integration}.d

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
