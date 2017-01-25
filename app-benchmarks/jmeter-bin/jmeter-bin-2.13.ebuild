EAPI="5"

inherit java-pkg-2 java-ant-2

KEYWORDS="~amd64 ~x86"

LICENSE="Apache-2.0"
DESCRIPTION="Load test and measure performance on HTTP/FTP services and databases."
SLOT="0"
IUSE="beanshell doc"

HOMEPAGE="http://jmeter.apache.org/"
SRC_URI="http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${PV}.tgz"

COMMON_DEP="
    beanshell? ( dev-java/bsh )
    >=dev-java/bsf-2.3
    =dev-java/junit-3.8*
    java-virtuals/javamail"
DEPEND=">=virtual/jdk-1.4
    doc? ( >=dev-java/velocity-1.4 )
    dev-java/ant-nodeps
    sys-apps/sed
    ${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.4
    ${COMMON_DEP}"

S=${WORKDIR}/apache-jmeter-${PV}

src_unpack() {
    unpack ${A}

    cd "${S}"
}

src_install() {
    DIROPTIONS="--mode=0775"
    dodir /opt/${PN}
    local dest="${D}/opt/${PN}/"
    cp -pPR bin/ lib/ README printable_docs/ "${dest}"
    if use doc; then
        cp -pPR printable_docs "${dest}" || die "Failed to install docs"
    fi
    dodoc README || die
    use doc && dohtml -r docs/*
} 
