SHELL = /bin/bash

DIRS = $(shell ls -d */)
CLEAN_DIRS = $(shell ls -d */)

export CMD = $(MAKECMDGOALS)

ifndef .VERBOSE
  .SILENT:
endif

define make
  STR="$(1)";\
  printf "%b%20s%-20s%b\n" "\033[0;96;4;1m" `echo $$STR | cut -c 1-$$(($${#STR}/2))` `echo $$STR | cut -c $$(($${#STR}/2+1))-$${#STR}` "\033[0m"
  if [ -e "$(1)/Makefile" ]; then\
    cd $(1) && $(MAKE) $(2);\
  fi
endef

all: build

build: pre_build $(DIRS)

clean: pre_clean $(DIRS)

$(DIRS): FORCE
	$(call make,$@, $(CMD))

FORCE:

pre_build:
	printf "\033[0;92;1m"
	printf "=%.0s" {1..40}
	printf "\033[0m\n"
	STR="BUILDING";\
	printf "%b%20s%-20s%b\n" "\033[0;92;1m" `echo $$STR | cut -c 1-$$(($${#STR}/2))` `echo $$STR | cut -c $$(($${#STR}/2+1))-$${#STR}` "\033[0m"
	printf "\033[0;92;1m"
	printf "=%.0s" {1..40}
	printf "\033[0m\n\n"

pre_clean:
	printf "\033[0;93;1m"
	printf "=%.0s" {1..40}
	printf "\033[0m\n"
	STR="CLEANING";\
	printf "%b%20s%-20s%b\n" "\033[0;93;1m" `echo $$STR | cut -c 1-$$(($${#STR}/2))` `echo $$STR | cut -c $$(($${#STR}/2+1))-$${#STR}` "\033[0m"
	printf "\033[0;93;1m"
	printf "=%.0s" {1..40}
	printf "\033[0m\n\n"
