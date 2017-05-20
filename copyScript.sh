FILES=`ls *.java`
ECLIPSE_PATH='../../Part02/Part02/src/osp/Memory'
echo $FILES

for f in $FILES; do
	cmp ./$f $ECLIPSE_PATH/$f
	if [ $? -ne 0 ]; then
		cp $ECLIPSE_PATH/$f ./
	fi
done

