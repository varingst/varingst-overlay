# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="EXAMPLES.md LANGUAGE_SERVER.md OVERVIEW.md README.md SERVER.md"
RUBY_FAKEGEM_EXTRAINSTALL="yardoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Ruby LSP Server"
HOMEPAGE="https://www.solargraph.org"
SRC_URI="https://github.com/castwide/solargraph/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/coderay-1.1
	>=dev-ruby/eventmachine-1.2.5
	>=dev-ruby/htmlentities-4.3.4
	>=dev-ruby/kramdown-1.16
	>=dev-ruby/parser-2.4
	>=dev-ruby/reverse_markdown-1.0.5
	>=dev-ruby/rubocop-0.52.1
	>=dev-ruby/thor-0.19.4
	>=dev-ruby/tilt-2.0
	>=dev-ruby/yard-0.9
"

each_ruby_prepare() {
	sed -i -e '/simplecov/ s:^:# :' \
	       -e '/SimpleCov/ s:^:# :' spec/spec_helper.rb || die

	# Fails in install sandbox.
	# Probably replated to 'making assumptions on load ordering',
	# see comment in the yard-0.9.16.ebuild
	rm -f spec/diagnostics/require_not_found_spec.rb || die
	rm -f spec/yard_map_spec.rb || die

	# passes, but hangs for 30 seconds ..
	sed -i -e '/^  it "handles \$\/solargraph\/documentGems/,/^  end/ s:^:# :' \
		spec/language_server/protocol_spec.rb || die
}
