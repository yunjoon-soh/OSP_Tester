#OSP2 Testing Script
##OSP2
OSP Introduction
http://www3.cs.stonybrook.edu/~sas/courses/cse523/osp.html

##Objective
Exhaustive tests on OSP2

##Tested environment
* grep: grep (BSD grep) 2.5.1-FreeBSD
* bash: 3.2.57(1)-release
* sed: sed (GNU sed) 4.2.2

##Precondition
This script internally calls "make run". Therefore, the make run has to be correctly setup before running the script.

##Side effect
1. May override existing log files (Conventionally named log_X.log, where X is the X's test's log output). 
2. If Java-wise error occurs, test may not finish.