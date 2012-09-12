# IPM - Ivy Project Manager

## Overview
IPM is a tool in the same vein as npm and rbenv, allowing you to create a workspace (which is based on the filesystem, not on the bash session), create projects within that workspace, and manage dependencies of and between those projects using the ant build system and the ivy dependency plugin for ant.



## How it works
IPM is a tool for creating initial build scripts and project dependencies

First, create a workspace

	ipm workspace create <workspace-name> (creates a workspace in <workspace-name> folder)



Now, within the workspace folder, create some projects

	ipm project create <organization> <project-name>	

'''
ipm project create com.myproject myproject-common
ipm project create com.myproject myproject-tools
'''

Now, within the project folders, create some dependencies
	ipm dependency add <organization> <module-name> <version (default: latest)>

'''
ipm dependency add org.codehaus.jackson jackson-mapper 1.8.3
'''

You can also create dependencies between projects of your own, and build order will be managed for you.
ipm 

## Extending IPM
Documentation to follow

## Dependencies
Assumes that ant has been installed. Will automatically pull down and install ivy for you.

## References
- [ant] (http://ant.apache.org)
- [ivy] (http://ant.apache.org/ivy)

## Development
- [Bugs] (https://github.com/clusterfudge/ipm/issues)

