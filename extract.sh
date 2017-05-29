#!/bin/sh

# Remove any existing old results
rm total_swept avg_swept serv_time total_task
rm total_swept_refined avg_swept_refined serv_time_refined total_task_refined

# From every file extract values
for f in `ls *.log
do	
		grep "[Ee]rror" $f
		if [ $? -ne 0 ]; then
				# tail -3 means take the last 3 lines
				grep "Total number of cylinders swept" $f | tail -3 >> total_swept
				grep "Average number of cylinders swept per disk access" $f | tail -3 >> avg_swept
				grep "Service time per I/O request:" $f | tail -3 >> serv_time
				grep "Total number of tasks:" $f | tail -1 >> total_task
		fi
done

# Remove string and keep the values only
sed 's/Total number of cylinders swept =//g' < total_swept > total_swept_refined
sed 's/Average number of cylinders swept per disk access = //g' < avg_swept > avg_swept_refined
sed 's!Service time per I/O request:!!g' < serv_time > serv_time_refined
sed 's!Total number of tasks:!!g' < total_task > total_task_refined

