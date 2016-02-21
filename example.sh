#! /bin/sh
set -e

# (should?) fail on Appveyor with MSYS2-MinGW64 with something like
# ./example.sh: line 6: 0: Bad file descriptor
if cat <&0 </dev/null ; then
    echo "OK"
else
    echo "FAIL"
fi

if cat 0<&0 </dev/null ; then
    echo "OK"
else
    echo "FAIL"
fi
