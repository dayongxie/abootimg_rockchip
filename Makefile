
CPPFLAGS=-DHAS_BLKID
CPPFLAGS=-DUSE_OPENSSL
CFLAGS=-O3 -Wall
LDLIBS=-lblkid
LDLIBS=-lssl -lcrypto

all: abootimg

version.h:
	if [ ! -f version.h ]; then \
	if [ -d .git ]; then \
	echo '#define VERSION_STR "$(shell git describe --tags --abbrev=0)"' > version.h; \
	else \
	echo '#define VERSION_STR ""' > version.h; \
	fi \
	fi

abootimg.o: bootimg.h version.h

clean:
	rm -f abootimg *.o version.h

.PHONY:	clean all

