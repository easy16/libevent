# Generated automatically from Makefile.in by configure.
#
# Makefile for libevent
#
# Dug Song <dugsong@monkey.org>
#
# $Id: Makefile.in,v 1.1 2000/11/14 04:11:01 dugsong Exp $

srcdir          = .

install_prefix  =
prefix          = /usr
exec_prefix	= ${prefix}
libdir		= ${exec_prefix}/lib
mandir		= ${prefix}/man

CC	= gcc
CFLAGS	= -g -O2 -I.
LDFLAGS	= 

INSTALL	= /usr/bin/install -c
INSTALL_DATA	= ${INSTALL} -m 644

HDRS	= event.h
SRCS	= event.c
OBJS	= $(SRCS:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -c $(srcdir)/$*.c

all: libevent.a

libevent.a: $(OBJS)
	@echo "building $@"
	ar cru $@ $(OBJS)
	ranlib $@

install:
	$(INSTALL) -d $(install_prefix)$(libdir)
	$(INSTALL_DATA) libevent.a $(libdir)
	$(INSTALL) -d $(install_prefix)$(mandir)/man3
	$(INSTALL_DATA) *.3 $(install_prefix)$(mandir)/man3

clean:
	rm -f *.o *~ libevent.a

distclean: clean
	rm -f Makefile config.h config.cache config.log config.status

# EOF
