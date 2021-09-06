# Intro

This repo contains several bash script files to make it easier to use GitHub Classroom for pulling and grading students assignments. 

The repo should be cloned to a non-repo directory for a given classroom organization, e.g.,'zStudent-assignments'

The scripts use GitHub api v3, curl 7.49.1 and grep 2.5.1. They were originally developed by Brian Konzman and updated by Richard Ressler (rressler@american.edu) to enable using a GitHub PAT stored in a Mac OS Keychain

If you have a windows machine, recommend installing GitHub [Classroom Assistant](https://classroom.github.com/assistant).  You can also use GitHub CA with a Mac. However, the scripts below provide Mac Users easier ability to automatically pull and push each set of repos over time.

Once installed:

- Go to the GitHub Classroom, click on the assignment, and click Download Repositories. 
- Identify the location to download (you may have to click on the pencil to edit from /tmp) 
- GitHub CA will create a date-time-stamped folder and clone each repo into it.
  - Any students that have not accepted the assignment will be missing
- If you download later, you will get a new date-time-stamped folder with the current repos.

# User Edits


1. Edit the 'clone_all.sh' file to customize the parameters to themselves and for each classroom.

- organization="21F-DATA-413-613"  # Line 21 - the Github Classroom Organization with the student repos
- GHusername="rressler"            # Line 22 - the instructor GitHub user name
- protocol="https"                 # Line 23 - the protocol for connecting to GitHub (should be https)
	
2. Edit the 'clone_all.sh' file to choose the option of entering a GitHub account password or Personal Access Token (PAT) interactively (each time), or storing their credentials in their Mac's Keychain for automated entry.

- If opting for the interactive version, use a "#"" to comment out line 28 with the '* _mac_keychain.sh' and un-comment line 29 with the '* _pw_entry.sh'.  
- If opting to use a credential stored in the Mac OS Keychain utility, ensure line 28 is not commented out and the pw_entry line (line 29) is commented out (using a "#"")  

3. If using the Mac OS Keychain, edit the 'clone_all_base_mac_keychain.sh' file to add your **MAC user information** in line 30 and the Keychain **Name** for the GitHub credential in line 31.

# Usage
Prior to first using the scripts, edit the one (or two) files as described in User Edits to ensure they have the correct parameters. 
  
Each time you want to grade an assignment:  

1. Use a terminal window to navigate to the mass_clone directory. (May want to make it an RStudio Project for ease of use)

2. Enter 'bash clone_all.sh *identifier*' where *identifier* is the **name of the assignment used by GitHub Classroom as the prefix for each student's repo**, e.g., `bash clone_all.sh hw01`.  

3. The script will then create a new folder with the name of the identifier and clone the new repos for each student under that folder.  

4. If a student's repo already exists, the script will execute a `git pull` to update the repo.  

Grade the assignment, making comments to files as desired. If you want to change the code, you may want to create a branch to preserve the original code in the main branch.

  - `branch instructor`  
  - Then use `branch switch instructor` followed by 
  - `git push origin instructor` to create the branch on GitHub.

After grading is complete, you can use the terminal window to run `bash push_all.sh identifier` to push your feedback to the students.

# Files
## clone_all_base_*.sh

There are two base scripts: one for interactive credential entry and one for using Mac OS Key chain.  
  - clone_all_base_pw_entry.sh  
  - clone_all_base_mac_keychain.sh

The scripts take 4 arguments (each in quotes) to clone repos:  
  - organization(github classroom),  
  - a unique identifier for the assignment, e.g., the GitHub classroom name,  
  - GitHub username, and  
  - GitHub security protocol (https or ssh).  

If using the mac_keychain version, edit it to add your mac keychain information for the GitHub credential.

Both scripts will make a new folder based on the unique identifier, then clone each repo under that folder, or if the repo exists execute a git pull for it.

If you would like to have osx remember your credentials to use https: see https://help.github.com/articles/caching-your-github-password-in-git/

If you would like to setup an ssh key: see  https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

If you are running Windows, this stack post may help with ssh: https://stackoverflow.com/questions/18404272/running-ssh-agent-when-starting-git-bash-on-windows

## clone_all.sh

This shell script will call either of the clone_all_base_*.sh scripts to clone multiple (or pull existing)  repositories for given assignment using the parameters edited into the script.  

Edit the script to add the parameters for each classroom and choose (comment out the other line) the desired method of passing the credential to GitHub: interactive or via Mac Keychain


## push_all.sh

Adds all files, commits, then pushes all changes.

Takes 1 argument, the unique identifier (name of the folder containing assignment repos)

Uses the commit message "Graded", but you can edit that.

