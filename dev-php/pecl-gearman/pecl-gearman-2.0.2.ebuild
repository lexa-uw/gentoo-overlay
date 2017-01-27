EAPI="6"

PHP_EXT_NAME="gearman"
PHP_EXT_S="${WORKDIR}/${PN}-gearman-${PV}"

USE_PHP="php7-1 php7-0"

inherit php-ext-pecl-r3

S="${WORKDIR}/${PN}-gearman-${PV}"
SRC_URI="https://github.com/wcgallego/${PN}/archive/gearman-${PV}.tar.gz -> ${PV}.tar.gz"

DESCRIPTION="PHP extension for using gearmand with PHP 7"

LICENSE="PHP License"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-cluster/gearmand-1.1.12"
RDEPEND="${DEPEND}"

