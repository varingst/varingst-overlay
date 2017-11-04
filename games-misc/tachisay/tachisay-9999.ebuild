# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="configurable talking ASCII tachikoma"
HOMEPAGE="https://github.com/varingst/tachisay"
EGIT_REPO_URI="https://github.com/varingst/tachisay.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="issue"

DEPEND="
	>=app-shells/bash-4.0
"
RDEPEND="${DEPEND}"

src_install() {
	dobin asciisay
	dobin tachisay
	insinto "/usr/share/tachisay"
	doins "tachi.ascii"

	if use issue; then
		exeinto "/etc/local.d"
		doexe "tachigreeter.start"
		if [[ ! -L /etc/runlevels/default/local ]]; then
			ewarn "local appears not to be added to runlevel default"
			ewarn "run rc-update add local default"
		fi
	fi
}
