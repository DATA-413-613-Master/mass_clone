# Intro

This repo contains three bash script files that work together as an alternative to using GitHub [Classroom Assistant](https://classroom.github.com/assistant). Two scripts allow both clone and pull for assignment repos without having to manage the multiple directories created by Classroom Assistant. The third script pushes graded assignments back to GitHub.

This repo should be cloned to a non-repo directory, e.g.,`zStudent-assignments` and it will create a  directory under that non-repo directory for each assignment and clone the student repos for that assignment to the new directory. e.g., `zStudent-assignments/hw01`.

The scripts use GitHub api v3. These scripts are based on scripts by Brian Konzman. Richard Ressler (rressler@american.edu) created new versions to enable the use of a GitHub Personal Access Token (PAT) since the API will no longer accept passwords. 

# Structure

The three script files are:  

- `clone_all.sh`:  used to configure the settings and call `clone_all_base_iwm.sh` with the proper arguments to clone/pull the repos
- `clone_all_base_iwm.sh`:  Can be run on its own with seven arguments to engage with GitHub API to clone/pull student repos. Probably easier to use `clone_all.sh` once it is configured.
- `push_all.sh`: once repos are cloned, can push any changes back to students.

There are three modes of use:  

1. interactive: The user must enter the PAT into the console when requested  
2. mac: allows the user to store/access a PAT in the Mac Keychain  
3. windows: allows the user to store/access a PAT in the Windows version of [Git Credential Manager (GCM)](https://github.com/GitCredentialManager/git-credential-manager) that comes in Git for Windows version 2.28 or higher.


# User Configuration

Edit the 'clone_all.sh' file to customize the arguments to yourself and for each classroom.

  `organization="your_github_semester_organization"`: Update for each semester/classroom  
	`GHusername="your_GitHub_username"`  
	`protocol="https"`: "https" or "SSH"   
	`mode="windows"`: "interactive", or "mac" or "windows"  
	`mac_user_name="my_computer's_user_name"`: if using mode mac, enter the mac OS user account name   
  `mac_keychain_name="github.com"`: if using mode mac, enter the MAC OS keychain name for the GitHub PAT  

- Warning: if you want to use SSH with mode windows you will need to modify line 66 in `clone_all_base_iwm.sh` to read `protocol=ssh`.

# Usage

Ensure you have an active GitHub PAT with the scope to clone the repos. See GitHub help for [Creating a Personal Access Token (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

Save the updated `clone_all.sh` file with your configuration for the class. If you have multiple classes, create copies for each class with a different file name.
  
Each time you want to grade an assignment:  

1. Use a terminal window to navigate to the `mass_clone` directory. (May want to make it an RStudio Project for ease of use)

2. Enter `bash clone_all.sh *identifier*` where *identifier* is the **name of the assignment used by GitHub Classroom as the prefix for each student's repo**, e.g., `bash clone_all.sh hw01`.  

3. The script will create a new folder (if it does not exist) with the name of the identifier and then clone the new repos for each student under that folder.  

4. If a student's repo already exists, the script will execute a `git pull` to update the repo.  

Grade the assignment, making comments to files as desired. If you want to change the code, you may want to create a branch to preserve the original code in the main branch.

  - `branch instructor`  
  - Then use `branch switch instructor` followed by 
  - `git push origin instructor` to create the branch on GitHub.

After grading is complete, you can use the terminal window to run `bash push_all.sh identifier` to push your feedback to the students.

# Other References

If you would like to have osx remember your credentials to use https: see https://help.github.com/articles/caching-your-github-password-in-git/

If you would like to setup an ssh key: see  https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

If you are running Windows, this stack post may help with ssh: https://stackoverflow.com/questions/18404272/running-ssh-agent-when-starting-git-bash-on-windows

# Notes
- These scripts were updated in Jan 2022.
  - The scripts for different modes were combined into one script to allow all three modes: interactive mode (expected to be rare), mac keychain mode, or windows GCM mode.
  - Now users only have to edit one file to set their configuration and it is easy to create multiple versions for different courses as they can all call the one base script.
  - If the PAT is not already stored, the Github or GIT Credential manager will pop up and ask. Select the Token mode.


