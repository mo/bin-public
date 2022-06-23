#!/bin/bash

PARAMS="$@"
if [ ! -f "$PARAMS" ]; then
        PARAMS=$(fix-filename $PARAMS)
fi
FILENAME=$(echo $PARAMS | cut -d : -f 1)
LINE=$(echo $PARAMS | cut -d : -f 2)

touch $FILENAME
chmod +x $FILENAME

# NOTE: "echo $STR | cut -d : -f N" returns all of $STR if $
if [ "$LINE" == "$FILENAME" ]; then
        nano "$PARAMS"
else
        nano +$LINE $FILENAME
fi
