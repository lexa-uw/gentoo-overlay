EAPI="6"

MY_PV="ddf59bbf970a1ba6785654eb99303b498267f832"
PHP_EXT_S="${WORKDIR}/php-profiler-extension-${MY_PV}"
PHP_EXT_ECONF_ARGS=""
PHP_EXT_NAME="tideways"
USE_PHP="php5-6 php7-0 php7-1"

inherit php-ext-source-r3

SRC_URI="https://github.com/tideways/php-profiler-extension/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"

HOMEPAGE="https://tideways.io/"
DESCRIPTION="PHP extension that adds profiling support using Tideways service"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

S="${WORKDIR}"
