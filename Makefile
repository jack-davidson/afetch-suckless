SRC = fetch.c
CC ?= cc
CFLAGS = -O2 -std=c89 -Wall -Wextra
LDFLAGS = -lpthread
DEBUGFLAGS = -g -Og -std=c89 -Wall -Wextra
PREFIX ?= /usr/local

all: clean afetch

afetch: ${SRC} config.h colour.h
	${CC} ${CFLAGS} ${SRC} ${LDFLAGS} -o afetch

debug:
	${CC}  ${DEBUGFLAGS} ${SRC} ${LDFLAGS} -o afetch-debug

clean:
	rm -rf afetch afetch.dSYM afetch-debug afetch-debug.dSYM

install: afetch
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp afetch ${DESTDIR}${PREFIX}/bin
	chmod 711 ${DESTDIR}${PREFIX}/bin/afetch

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/afetch

.PHONY: all clean debug install uninstall
