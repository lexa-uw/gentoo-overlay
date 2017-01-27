EAPI="6"

PHP_EXT_NAME="protobuf"

USE_PHP="php5-6"

PHP_EXT_PECL_FILENAME="protobuf-3.1.0a1.tgz"
PHP_EXT_S="${WORKDIR}/protobuf-3.1.0a1"

inherit php-ext-pecl-r3

S="${WORKDIR}/protobuf-3.1.0a1"

DESCRIPTION="Protobuf V3 driver for PHP"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
