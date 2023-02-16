#!/bin/sh
prg=`basename $0`

ARCHS=${ARCHS:-'arm64 x86_64'}
OUTPUT_DIR='macos/output'

die()
{
	echo "$prg: $@" 1>&2
	exit 1
}

for arch in $ARCHS; do
	outdir="$OUTPUT_DIR/$arch"
	test -r "$outdir/cgit" || die "$outdir/cgit doesn't exist"
done

lipo -create -output "$OUTPUT_DIR/cgit" "$OUTPUT_DIR/arm64/cgit" \
	"$OUTPUT_DIR/x86_64/cgit"
