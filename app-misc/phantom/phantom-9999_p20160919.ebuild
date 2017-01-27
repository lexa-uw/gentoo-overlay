EAPI="6"

inherit eutils toolchain-funcs

DESCRIPTION="I/O engine with some modules"
HOMEPAGE="https://github.com/yandex-load/phantom"
GIT_SHA1="f703e51"
SRC_URI="https://github.com/yandex-load/phantom/tarball/${GIT_SHA1} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-devel/binutils"
RDEPEND="${DEPEND}"

S="${WORKDIR}/yandex-load-phantom-${GIT_SHA1}"

src_compile() {
    emake -R CXX="$(tc-getCXX)" || die "Make failed!"
}

src_install() {
    mkdir -p ${D}/usr/lib
    mkdir -p ${D}/usr/bin
    cp -a ${S}/lib/* ${D}/usr/lib/
    cp -a ${S}/bin/phantom ${D}/usr/bin/phantom
}

