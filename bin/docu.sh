#!/bin/sh

DOCU_DIR=~/.quickdocu
DOC_FILE=$DOCU_DIR/$1

if [ "$1" == "-h" ]; then
	echo "usage: docu docfile [text]"
elif [ -n $1 -a -z "$2" ]; then
	if [ -f $DOC_FILE ]; then
		less $DOC_FILE
	else
		echo "no docu found for '$1'"
	fi
elif [ -n "$2" ]; then
	DIR=$(dirname $DOC_FILE)
	if [ ! -d $DIR ]; then
		mkdir -p $DIR
	fi
	echo $(date)$'\n'$2$'\n' >> $DOC_FILE
else
	tree --noreport -- $DOCU_DIR
fi
