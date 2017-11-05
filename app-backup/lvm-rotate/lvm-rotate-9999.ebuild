# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="OpenRC and backup script for lvm snapshots"
HOMEPAGE="https://github.com/varingst/lvm-rotate"
EGIT_REPO_URI="https://github.com/varingst/lvm-rotate.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin lvm-rotate
	doinitd init.d/lvm-rotate
	doconfd conf.d/lvm-rotate
}
