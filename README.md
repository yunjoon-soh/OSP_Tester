# OSP2 Testing Script
## OSP2
OSP Introduction
http://www3.cs.stonybrook.edu/~sas/courses/cse523/osp.html

## Objective
Exhaustive tests on OSP2

## Tested environment
* grep: grep (BSD grep) 2.5.1-FreeBSD
* bash: 3.2.57(1)-release
* sed: sed (GNU sed) 4.2.2

## Precondition
This script internally calls "make run". Therefore, the make run has to be correctly setup before running the script.

## Side effect
1. May override existing log files (Conventionally named log\_X.log, where X is the X's test's log output). 
2. If Java-wise error occurs, test may not finish.

## copyScript.sh
: Script used to syncrhoize eclipse env. and command-line running env.

### Usage
1. Set the eclipse path correctly inside the script file
2. Locate the script as the same folder as Makefile
3. Include rule in Makefile that would run this script

## extract.sh/stat.sh
: Extract values from multiple log files and calculate basic statistics.

### Usage
1. Run the testing script to get the log files
2. Locate the log files and run extract.sh
3. Run stat.sh with the resulting files of extract.sh present in the same folder

### Note
If one is interested in different stat, need to customize using the specific string used in the log file

