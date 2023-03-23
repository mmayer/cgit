#!/bin/sh

exec `dirname $0`/build-pkg.sh --skip $@
