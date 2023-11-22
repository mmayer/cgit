#!/bin/sh
prg=`basename $0`

ARCHS=${ARCHS:-'arm64 x86_64'}
OUTPUT_DIR='macos/output'
skip_mode=0

die()
{
	echo "$prg: $@" 1>&2
	exit 1
}

[ "$1" = "--skip" ] && skip_mode=1

test -r Makefile || die "script must be run from the top directory"

for arch in $ARCHS; do
	outdir="$OUTPUT_DIR/$arch"
	DESTDIR="$outdir/install"
	export DESTDIR
	rm -rf "$DESTDIR"
	test -d "$outdir" || mkdir -p "$outdir"
	PATH=/usr/bin:/bin make -j \
		LUA_PKGCONFIG=lua \
		CFLAGS="-O2 -target $arch-apple-macos11.3 -std=c2x" \
		LUA_CFLAGS="-I`pwd`/../lua" \
		LUA_LIBS="`pwd`/../lua/liblua-$arch.a" \
		install || exit 1
	cgi=`find "$DESTDIR" -name cgit.cgi`
	strip "$cgi"
	install -m 0644 macos/cgit-apache.conf \
		macos/output/$arch/install/opt/cgit/etc
	if [ $skip_mode = 0 ]; then
		pkgbuild --root "$DESTDIR" --scripts `dirname $0`/pkg-scripts \
			--identifier cgit cgit-$arch.pkg || exit 1
	fi
	make clean
	make -C git clean
	echo "=================================================="
	ls -l "$cgi"
	echo "=================================================="
done
