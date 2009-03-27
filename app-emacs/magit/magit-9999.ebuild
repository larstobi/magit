# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/emacs-w3m/emacs-w3m-1.4.4-r2.ebuild,v 1.7 2007/12/02 23:44:18 opfer Exp $

inherit autotools elisp eutils git

DESCRIPTION="A Emacs mode for Git."
HOMEPAGE="http://zagadka.vm.bytemark.co.uk/magit/"
EGIT_REPO_URI="git://gitorious.org/magit/mainline.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 ppc sparc x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

SITEFILE=50magit-gentoo.el

src_unpack() {
	git_src_unpack
	cd ${S}
	eautoreconf
}

src_compile() {
	econf --with-lispdir=${D}/${SITELISP}/${PN} || die
	emake || die
}

src_install() {
	einstall || die
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc README NEWS COPYING
}

pkg_postinst() {
	elisp-site-regen
}

pkg_postrm() {
	elisp-site-regen
}
