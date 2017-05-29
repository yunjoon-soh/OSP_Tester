#!/bin/sh
### This script syncronizes the running env. and eclipse env. *.java files

### Fixed variables
FILES=`ls *.java`
ECLIPSE_PATH='../../Part02/Part02/src/osp/Memory'

### Echo list of files to be tested for copy
echo $FILES

for f in $FILES; do
    # Compare the file is not synchronized between running env. and eclipse env.
	cmp ./$f $ECLIPSE_PATH/$f

	# If cmp returned non-zero return value
	if [ $? -ne 0 ]; then

		# Copy the file
		cp $ECLIPSE_PATH/$f ./
	fi
done

