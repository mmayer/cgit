#!/bin/sh
prg=`basename $0`

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
	test -d "$outdir" || mkdir -p "$outdir"
	make -j CFLAGS="-O2 -target $arch-apple-macos11"
	strip cgit
	mv cgit "$outdir"
	make clean
	make -C git clean
done
