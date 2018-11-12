# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDOR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Ruby gem to convert html into markdown"
HOMEPAGE="https://github.com/xijo/reverse_markdown"
SRC_URI="https://github.com/xijo/reverse_markdown/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/nokogiri"

all_ruby_prepare() {
	sed -i -e '/simplecov/ s:^:# :' \
		   -e '/^SimpleCov.profiles/,/^end$/ s:^:# :' \
		   -e '/^SimpleCov.start/ s:^:# :' spec/spec_helper.rb || die
}
