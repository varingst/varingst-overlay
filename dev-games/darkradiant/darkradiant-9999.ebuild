# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 python-single-r1 autotools

DESCRIPTION="An open-source level editor for Doom 3 and The Dark Mod"
HOMEPAGE="http://darkradiant.sourceforge.net/"
EGIT_REPO_URI="https://github.com/codereader/DarkRadiant.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+darkmod-plugins"

DEPEND="
	>=x11-libs/wxGTK-3.0
	>=dev-libs/boost-1.46.1
	media-libs/ftgl
	media-libs/glew
	>=dev-libs/libsigc++-2.0
	dev-libs/libxml2
	sys-libs/zlib
	media-libs/libpng
	virtual/jpeg
	media-libs/libvorbis
	media-libs/freealut
"

RDEPEND="$DEPEND"


src_prepare() {
	sed -i -e '/plugins\/eclasstree\/Makefile/d' \
		   -e '/plugins\/entitylist\/Makefile/d' \
		   -e '/plugins\/undo\/Makefile/d' \
		   configure.ac

	eaclocal -I m4
	_elibtoolize --force --copy
	eautoheader
	eautoconf
	eautomake --add-missing --copy --foreign
}


src_configure() {
	econf \
		$(use_enable darkmod-plugins)
}
