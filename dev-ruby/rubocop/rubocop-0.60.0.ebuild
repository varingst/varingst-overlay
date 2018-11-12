# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md CONTRIBUTING.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="config"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_BINDIR="exe"

inherit ruby-fakegem

DESCRIPTION="Ruby static code analyzer and formatter"
HOMEPAGE="https://www.rubocop.org"
SRC_URI="https://github.com/rubocop-hq/rubocop/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/jaro_winkler-1.5.1
	>=dev-ruby/parallel-1.10
	>=dev-ruby/parser-2.5.1.2
	>=dev-ruby/powerpack-0.1
	<dev-ruby/rainbow-4.0
	>=dev-ruby/ruby-progressbar-1.7
	>=dev-ruby/unicode-display_width-1.4.0
"

ruby_add_bdepend "test? (
	dev-ruby/webmock
	dev-ruby/pry
	dev-ruby/rack:2
	dev-ruby/bundler
	dev-ruby/rubocop-rspec
)"

all_ruby_install() {
	all_fakegem_install
	for dir in relnotes manual; do
		docinto "$dir"
		dodoc -r "$dir"/*
	done
}
