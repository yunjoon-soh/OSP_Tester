#!/usr/bin/python

### This file read *refined generated files and calculate stats and print out the result

### total_swept
fname="total_swept_refined"
f = open(fname, 'r')
cnt=0 

lines = f.readlines()
total_swept=0

for line in lines:
    total_swept+=int(line.strip())
f.close()

### avg swept
fname2="avg_swept_refined"
f2 = open(fname2, 'r')

lines = f2.readlines()

avg_swept=0
for line in lines:
	avg_swept+=int(line.strip())
f2.close()

### service time
fname3="serv_time_refined"
f3 = open(fname3, 'r')

lines = f3.readlines()

serv_time=0
for line in lines:
	serv_time+=int(line.strip())
f3.close()

### total task
fname4="total_task_refined"
f4 = open(fname4, 'r')

lines = f4.readlines()

total_task=0
for line in lines:
	total_task+=int(line.strip())
f4.close()

print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("Total swept: " + str(total_swept))
print("Avg swept: " + str(avg_swept))
print("serv_time: " + str(serv_time))
print("total_task: " + str(total_task))
print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
