#! /bin/sh
set -e

# (should?) fail on Appveyor with MSYS2-MinGW64 with something like
# ./example.sh: line 10: 0: Bad file descriptor
test -n "$DJDIR" || exec 7<&0 </dev/null

# this should fail on all systems with something like
# ./example.sh: 10: ./example.sh: 3: Bad file descriptor
test -n "$DJDIR" || exec 7<&3
