EAPI="6"

PHP_EXT_NAME="gearman"

USE_PHP="php5-6 php5-5 php5-4"

inherit php-ext-pecl-r3

DESCRIPTION="PHP extension for using gearmand."

LICENSE="PHP License"
SLOT="1"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=">=sys-cluster/gearmand-0.21"
RDEPEND="${DEPEND}"

