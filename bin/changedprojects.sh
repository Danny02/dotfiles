#!/bin/sh

 git --no-pager diff --name-only $1 | findprojects.sh | sort | uniq