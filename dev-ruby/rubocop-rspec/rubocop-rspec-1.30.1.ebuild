# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="config tasks"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Code style checking for RSpec files"
HOMEPAGE="http://www.rubocop.org"
SRC_URI="https://github.com/rubocop-hq/rubocop-rspec/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	dev-ruby/rspec:3
	dev-ruby/rubocop
"

ruby_add_bdepend "
	dev-ruby/rspec-rails
"

all_ruby_install() {
	all_fakegem_install
	for dir in manual; do
		docinto "$dir"
		dodoc -r "$dir"/*
	done
}
