#!/bin/sh

VENDOR=samsung
DEVICE=baffinlite

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling device files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
#    cp /media/luk/57f8f4bc-abf4-655f-bf67-946fc0f9f25b/$FILE $BASE/$FILE
done

./setup-makefiles.sh
