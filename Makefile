PORTNAME=       webbuild
PORTREVISION=   1
CATEGORIES=     converters perl5 www
LICENSE=        GPLv2
NO_ARCH=        yes
NO_BUILD=       yes
COMMENT=        Pkg build for personal web app packages (pkg)
USE_GITHUB=     yes
GH_ACCOUNT=     spagu
GH_PROJECT=     ${PORTNAME}
USE_PERL5=      yes

RUN_DEPENDS+=   p5-JSON>=2.90_1:${PORTSDIR}/converters/p5-JSON

do-install:
	@${CP} -R ${WRKSRC}/src/${PORTNAME}.pl ${STAGEDIR}${PREFIX}/sbin/${PORTNAME}
	@${CHMOD} 777 ${STAGEDIR}${PREFIX}/sbin/${PORTNAME}

.include <bsd.port.mk>
