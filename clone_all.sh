#!/bin/sh

# Runs clone_all_base_iwm.sh to clone/pull a set of GitHub student repos
# Assumes the user has generated a GitHub PAT which
# 1. is available for pasting into the console in interactive mode, or,
# 2. is available from the mac Keychain or,
# 3. is available from the GitHub Credential Manager on Windows
#
# Edit lines 23-26, and,if using mode mac, lines 27, and 28.
# Written By: Richard Ressler based on work by Brian Konzman

if [[ $# -ne 1 ]]; #Check number of arguments
	then
	echo ""
	echo "This script should be edited by the user to set arguments for"
	echo "running clone_all_base_iwm.sh"
	echo ""
	echo "Please provide 1 argument:"
	echo "1. Name of the assignment on GitHub (e.g., hw01)"
else
	assignment=$1

	#edit these variables to be your defaults for a semester
	organization="21F-DATA-413-613"  # Update for each semester
	GHusername="rressler"
	protocol="https" # "https" or "SSH"
	mode="windows" # "interactive", or "mac" or "windows"
	mac_user_name="rressler"  # mac OS user account name
  mac_keychain_name="github.com" # the MAC OS keychain name for the GitHub personal access token

# Call the function to clone/pull the student repos
./clone_all_base_iwm.sh ${organization} ${assignment} ${GHusername} ${protocol} ${mode} ${mac_user_name} ${mac_keychain_name}
fi
