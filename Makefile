#Include the common makefile. Keep this here
-include erl-project/make/Makefile-common.mk
.PHONY : update
SHELL := /bin/bash

all::       update 
setup::		update
getdeps::   update

############################
#    DO NOT EDIT BELOW     #
############################

# Update erl-project. Allow failures of git (eg. executing git inside Mock env)
update: erl-project
	@echo "Updating erl-project"
	-@cd erl-project && git pull && cd ..

# Clone erl-project (only once executed) and add it to .gitignore
erl-project:
	@echo "Cloning erl-project"
	-@git clone -q git@github.com:spilgames/erl-project.git 
	-@$(shell [[ `grep -c "erl-project" .gitignore` -eq 0 ]] && echo "erl-project" >> .gitignore)
	@make $(MAKECMDGOALS)
