# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="OpenRC script for running syncthing with multiple users"
HOMEPAGE="https://github.com/varingst/syncthing-multiuser"
EGIT_REPO_URI="https://github.com/varingst/syncthing-multiuser.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	net-p2p/syncthing
"

src_install() {
	doinitd init.d/syncthing-multiuser
	doconfd conf.d/syncthing-multiuser
}
