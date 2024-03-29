#!/bin/bash

USAGE="
    $0 (name of file to look for figures in)
"

if [ $# -ne 1 ]
then
    echo "$USAGE"
    exit 1
fi

FILE="$1"

FIGS="$(grep "\!\[" $FILE  | sed -e 's/.*(//' | sed -e 's/).*//')"
FIGS="$FIGS $(grep "src=" $FILE  | sed -e 's/.*src="//' | sed -e 's/".*//')"
MISSING=""

for x in $FIGS
do 
    if [ -e $x ]
    then
        echo "."
    elif [ -e ${x%.png}.pdf ]
    then
        echo "making $x"
        make $x
    else
        MISSING="$MISSING $x"
        echo $x
    fi
done


for SOURCEDIR in "/home/peter/teaching/talks/idaho-march-2019" "/home/peter/teaching/talks/madison-sept-2018" "/home/peter/teaching/talks/france-may-2019"
do
    for x in $(echo $MISSING)
    do 
        if [ -e ${SOURCEDIR}/$x ]
        then
            mkdir -p $(dirname $x)
            cp ${SOURCEDIR}/$x $(dirname $x)
        elif [ -e $SOURCEDIR/$(basename ${x%.png}.pdf) ]
        then
            mkdir -p $(dirname $x)
            cp $SOURCEDIR/$(basename ${x%.png}.pdf) $(dirname $x) 
        fi
    done
done
