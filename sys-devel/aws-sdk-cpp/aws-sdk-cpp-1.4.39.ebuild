# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils

MY_V=${P/aws-sdk-cpp//}

DESCRIPTION="AWS SDk CPP version"
HOMEPAGE="https://github.com/aws/aws-sdk-cpp"
SRC_URI="https://github.com/aws/aws-sdk-cpp/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
	net-misc/curl
	dev-libs/openssl
"
src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_ONLY="ec2;s3"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

}
