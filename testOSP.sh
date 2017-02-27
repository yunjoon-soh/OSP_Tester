#!/bin/sh
################################################################################
# OSPTester.sh v0.1
# Exhaustive Tests for OSP2
################################################################################
# Constants
# Used for colorful output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
################################################################################
# Name of the default output log file
LOG_FILE_NAME=OSP.log
################################################################################
# Variables
S_cnt=0 # success count
W_cnt=0 # warning count
E_cnt=0 # error count
################################################################################
# Run for N number of test cases, where {1..N}
for i in {1..10}
do
		echo "================================================================================"
		echo "$0: Running $i's simulation"

		# Simulation length(default: 250000)
		# Note: `` is used to execute whatever is inside the backward quote and store to the variable
		SIM_LEN=`echo $((250000))`

		# When testing for various simulation length
		# SIM_LEN=`echo $(($i*50000))`

		# Echo the information about the test
		echo "$0: Modify the simulation length to $SIM_LEN"
		echo "--------------------------------------------------------------------------------"

		# Replace "SimulationLength" in the params.osp file
		sed -i "s|SimulationLength [0-9]*|SimulationLength $SIM_LEN|g" Misc/params.osp

		# Run the test
		make run

		# Silently check if the log contains the word case insensitive "Warning" or "Error" 
		grep -q "\([Ww]arning\|[Ee]rror\)" $LOG_FILE_NAME
		# option -q: silent check for Warning or Error, otherwise it will print out the result of grep which does not look clean
		GREP_RESULT=$? # save to variable before running anything else

		# Rename the log
		mv $LOG_FILE_NAME log_$i.log
		echo "--------------------------------------------------------------------------------"
		echo "$0: Renamed to log_$i.log"

		# $? : the exit code of latest execution, in this case result of "grep"
		#      if $? is 0 then it means there was no [Ww]arning or [Ee]rror in the log file

		if [ $GREP_RESULT -ne 0 ]; then
				echo "$0: ${GREEN}Ended successfully${NC}"
				S_cnt=$(($S_cnt+1))
		else
				# check whether the failure came from error
				# Note: if you grep "[Ww]arning" before "[Ee]rror", 
				# it is possible that when you both have Error and Warning in the log,
				# [Ee]rror is ignored. Therefore, check [Ee]rror first
				echo "$0: ${RED}Failed${NC}"
				grep -q "[Ee]rror" log_$i.log
				if [ $? -ne 0 ]; then
						W_cnt=$(($W_cnt+1))
				else
						E_cnt=$(($E_cnt+1))
				fi
		fi

		# Option -e for "echo": it prints out the colorful result for readability
done

# Save summary to the separate files
grep Simulation ./*.log > Summary
grep -A 15 [Ww]arning ./*.log > WarningSummary
grep -A 15 [Ee]rror ./*.log > ErrorSummary

# Print stats
echo "Success count: $S_cnt"
echo "Warning count: $W_cnt"
echo "Error   count: $E_cnt"
