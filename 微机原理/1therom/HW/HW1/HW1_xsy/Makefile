SHELL := /bin/bash

DIR   := $(HOME)/Desktop/HW1

.PHONY: help sort_file find_log list_lock_file delete_lock_file create_dummy clean_dummy

help:
	@printf '%s\n' "Targets (only under: $(DIR)):" \
	"  make sort_file         - list files/dirs in HW1 by size" \
	"  make find_log          - find *.log files in HW1 (top level)" \
	"  make list_lock_file    - list *.lock files in HW1 (top level)" \
	"  make delete_lock_file  - delete *.lock files in HW1 (top level)" \
	"  make create_dummy      - create demo hw1_*.log and hw1_*.lock in HW1" \
	"  make clean_dummy       - remove those demo files"

sort_file:
	@echo "Listing by size under: $(DIR)"
	@du -ah --max-depth=1 "$(DIR)" 2>/dev/null | sort -h

find_log:
	@echo "Searching *.log under: $(DIR)"
	@find "$(DIR)" -maxdepth 1 -type f -name '*.log' -printf '%p\t%k KB\n' 2>/dev/null | sort -k2 -h || true
	@count=$$(find "$(DIR)" -maxdepth 1 -type f -name '*.log' 2>/dev/null | wc -l); echo "Total .log files: $$count"

list_lock_file:
	@echo "Lock files under: $(DIR)"
	@find "$(DIR)" -maxdepth 1 -type f -name '*.lock' -print 2>/dev/null || true

delete_lock_file:
	@echo "Deleting *.lock files under: $(DIR)"
	@find "$(DIR)" -maxdepth 1 -type f -name '*.lock' -print -delete 2>/dev/null || true

create_dummy:
	@echo "Creating demo files in: $(DIR)"
	@for i in 1 2 3; do echo "demo $$i" > "$(DIR)/hw1_demo$$i.log"; done
	@for i in 1 2; do : > "$(DIR)/hw1_file$$i.lock"; done
	@ls -l "$(DIR)"/hw1_*.log "$(DIR)"/hw1_*.lock 2>/dev/null || true

clean_dummy:
	@echo "Removing demo files (hw1_*.log / hw1_*.lock) in $(DIR)"
	@rm -f "$(DIR)"/hw1_*.log "$(DIR)"/hw1_*.lock
	@echo "Done."

