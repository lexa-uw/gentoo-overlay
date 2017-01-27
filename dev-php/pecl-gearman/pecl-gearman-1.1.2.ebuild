EAPI=5
PHP_EXT_NAME="gearman"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

# php7-0 not supported for 1.1.2
USE_PHP="php5-6 php5-5 php5-4"

inherit php-ext-pecl-r2

KEYWORDS="amd64 ~x86"

DESCRIPTION="PHP extension for using gearmand."
LICENSE="PHP License"
SLOT="0"
IUSE=""

DEPEND=">=sys-cluster/gearmand-0.21"
RDEPEND="${DEPEND}"

