#!/bin/sh
pkg=`basename $0`

sudo installer -pkg cgit-`uname -m`.pkg  -target /
