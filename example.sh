#! /bin/bash

exec 3<&0 </dev/null
if [ $? -eq 0 ]; then
    echo "OK (no error)"
else
    echo "FAIL (error)"
fi

exec 0<&0 < /dev/null
if [ $? -eq 0 ]; then
    echo "OK (no error)"
else
    echo "FAIL (error)"
fi

cat 0<&0 </dev/null
if [ $? -eq 0 ]; then
    echo "OK (no error)"
else
    echo "FAIL (error)"
fi

exec <&4
if [ $? -ne 0 ]; then
    echo "OK (got error)"
else
    echo "FAIL (no error)"
fi

sh -c 'exec 3<&0 < /dev/null'
if [ $? -eq 0 ]; then
    echo "OK (no error)"
else
    echo "FAIL (got error)"
fi

bash -c 'exec <&4'
if [ $? -ne 0 ]; then
    echo "OK (got error)"
else
    echo "FAIL (no error)"
fi
