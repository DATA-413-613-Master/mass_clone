#!/bin/sh

# Runs clone_all_base.sh with defaults, designed to be user editable
# e.g., once in the mass_clone directory run: bash clone_all_helper_example.sh hw02

# Written By: Brian Konzman and Updated by Richard Ressler to use Keychain for Mac


if [[ $# -ne 1 ]];
	then
	echo ""
	echo "This script is designed to be edited by the user and will run clone_all_base.sh with defaults"
	echo ""
	echo "Please provide 1 parameter:"
	echo "1. Name of unique identifier(assignment)"
else

	assignment=$1

	#edit these variables to your defaults
	organization="21F-DATA-413-613"  #
	GHusername="rressler"
	protocol="https"

# Choose one of the following two lines to comment out: Line 1 is for using Passwrods or PATs in Mac Keychain
# Line 2 is for interactive entry of password or PAT
# Line 1 requires editing the clone_all_base_mac_keychain.sh file to add the Mac user info for the PW/PAT
	./clone_all_base_mac_keychain.sh ${organization} ${assignment} ${GHusername} ${protocol}
#	./clone_all_base_pw_entry.sh ${organization} ${assignment} ${GHusername} ${protocol}
fi


