# $NetBSD: Makefile,v 1.91 2024/06/13 13:46:59 bsiegert Exp $

DISTNAME=		mob-4.5.0
PKGREVISION=		5
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GITHUB:=remotemobprogramming/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://mob.sh/
COMMENT=		Swift git handover during remote mob programming
LICENSE=		mit

DEPENDS+=		xdg-utils-[0-9]*:../../misc/xdg-utils

post-extract:
	cd ${WRKSRC}/open && ${MV} open_linux.go open_unix.go

post-install:
	cd ${DESTDIR}${PREFIX}/bin && ${LN} -s mob ensemble

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
