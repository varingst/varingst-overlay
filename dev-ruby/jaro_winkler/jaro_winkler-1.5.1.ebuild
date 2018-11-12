# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="ext"

inherit ruby-fakegem

DESCRIPTION="Ruby & C implementation of Jaro-Winkler algorithm"
HOMEPAGE="https://github.com/tonytonyjan/jaro_winkler"
SRC_URI="https://github.com/tonytonyjan/jaro_winkler/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "test? (
	dev-ruby/minitest
)"

each_ruby_configure() {
	${RUBY} -Cext/${PN} extconf.rb || die "extconf.rb failed"
}

each_ruby_compile() {
	emake -Cext/${PN} \
		V=1 \
		CFLAGS="${CFLAGS} -fPIC" \
		archflag="${LDFLAGS}" || die "make extension failed"
	cp -l ext/${PN}/${PN}_ext.so lib/${PN}/ || die
}

each_ruby_test() {
	${RUBY} -Ilib:.:test -e 'Dir["test/**/test_*.rb"].each {|f| require f}' || die
}

each_ruby_install() {
	rm -rf ext/${PN}/*.o ext/${PN}/Makefile || die
	each_fakegem_install
}
