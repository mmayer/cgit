#!/bin/sh
prg=`basename $0`

die()
{
	echo "$prg: $@" 1>&2
	exit 1
}

test -d git || die "must be called from the top level directory"

(
cd git
make distclean
make configure
# Setting AR to /usr/bin/ar is *VERY* important. If "gar" (GNU ar) happens to be
# installed, the build would otherwise fail, since gar can't handle the macOS
# archive format correctly.
AR=/usr/bin/ar ./configure
)
