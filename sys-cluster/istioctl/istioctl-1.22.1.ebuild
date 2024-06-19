# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_PN="github.com/istio/istio/..."

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/istio/istio/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	http://mrgz.org/${P}-deps.tar.xz"

LICENSE="Apache-2.0 MIT BSD MPL-2.0 BSD-2 ISC imagemagick"

SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

go-module_set_globals

S="${WORKDIR}/istio-${PV}"

src_compile() {
	export BUILD_WITH_CONTAINER=0
	ego build -x ${EGO_BUILD_FLAGS} \
		-ldflags "${go_ldflags}" \
		-work -o "bin/${PN}" ./istioctl/cmd/istioctl || die
}

src_install() {
	dobin bin/istioctl
	insinto /usr/share/istio
	doins -r manifests
	doins -r samples
}

