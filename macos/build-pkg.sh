#!/bin/sh
pkg=`basename $0`

ARCHS=${ARCHS:-'arm64 x86_64'}
OUTPUT_DIR='macos/output'

die()
{
	echo "$prg: $@" 1>&2
	exit 1
}

test -r Makefile || die "script must be run from the top directory"

for arch in $ARCHS; do
	outdir="$OUTPUT_DIR/$arch"
	DESTDIR="$outdir/install"
	export DESTDIR
	rm -rf "$DESTDIR"
	test -d "$outdir" || mkdir -p "$outdir"
	make -j CFLAGS="-O2 -target $arch-apple-macos11" install
	cgi=`find "$DESTDIR" -name cgit.cgi`
	strip "$cgi"
	pkgbuild --root "$DESTDIR" --identifier cgit cgit-$arch.pkg
	make clean
	make -C git clean
done
