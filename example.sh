#! /bin/sh
set -e

# (should?) fail on Appveyor with MSYS2-MinGW64 with something like
# ./example.sh: line 6: 0: Bad file descriptor
echo hello|cat <&0

# should print goodbye
echo goodbye | (exec 7<&0; cat <&7)

# this should fail on all systems with something like
# ./example.sh: line 11: 7: Bad file descriptor
cat <&7
