# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="data"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Determines the monospace display with of a string"
HOMEPAGE="https://github.com/janlelis/unicode-display_width"
SRC_URI="https://github.com/janlelis/unicode-display_width/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# These tests depend on an emoji library by the same author.
each_ruby_prepare() {
	sed -i -e '/^  describe.*emoji/,/^  end/ s:^:# :' \
		spec/display_width_spec.rb || die
}
