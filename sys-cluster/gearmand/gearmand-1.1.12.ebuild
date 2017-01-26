# Copyright 1999-2015 Gentoo Foundation

EAPI=5

inherit flag-o-matic libtool

DESCRIPTION="Generic framework to farm out work to other machines"
HOMEPAGE="http://www.gearman.org/"
SRC_URI="http://launchpad.net/gearmand/1.2/${PV}/+download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="debug tcmalloc memcache sqlite tokyocabinet postgres"

RDEPEND="dev-libs/libevent
    >=dev-libs/boost-1.39
    || ( >=sys-apps/util-linux-2.16 <sys-libs/e2fsprogs-libs-1.41.8 )
    tcmalloc? ( dev-util/google-perftools )
    memcache? ( >=dev-libs/libmemcached-0.47 )
    sqlite? ( dev-db/sqlite:3 )
    tokyocabinet? ( dev-db/tokyocabinet )
    postgres? ( >=dev-db/postgresql-9.0 )"
DEPEND="${RDEPEND}
    virtual/pkgconfig"

pkg_setup() {
   enewuser gearmand -1 -1 /dev/null nogroup
}

src_prepare() {
    elibtoolize
}

src_configure() {
    # Don't ever use --enable-assert since configure.ac is broken, and
    # only does --disable-assert correctly.
    if use debug; then
        # Since --with-debug would turn off optimisations as well as
        # enabling debug, we just enable debug through the
        # preprocessor then.
        append-cppflags -DDEBUG
    else
        myconf="${myconf} --disable-assert"
    fi

    econf \
        --disable-static \
        --disable-dependency-tracking \
        --disable-mtmalloc \
        $(use_enable tcmalloc) \
        $(use_enable memcache libmemcached) \
        $(use_with sqlite sqlite3) \
        $(use_enable tokyocabinet libtokyocabinet) \
        $(use_enable postgres libpq)
}

src_test() {
    # Since libtool is stupid and doesn't discard /usr/lib64 from the
    # load path, we'd end up testing against the installed copy of
    # gearmand (bad).
    #
    # We thus cheat and "fix" the scripts by hand.
    sed -i -e '/LD_LIBRARY_PATH=/s|/usr/lib64:||' "${S}"/tests/*_test \
        || die "test fixing failed"

    emake check
}

DOCS=( README AUTHORS ChangeLog )

src_install() {
    default

    newinitd "${FILESDIR}"/gearmand.init.d.2 gearmand
    newconfd "${FILESDIR}"/gearmand.conf.d gearmand

 find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
    elog ""
    elog "See more info on http://gearman.org/manual/job_server"
    elog ""
}

