# ================================
# Makefile for Raspberry Pi Shell Assignment (Universal Version)
# ================================
SHELL := /bin/bash

# 默认目标：显示帮助信息
all:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "  sort_file           - List files and directories sorted by file size"
	@echo "  find_log            - Find all .log files in your home directory"
	@echo "  delete_lock_file    - Find and delete all .lock files in your home directory"
	@echo "  demo                - Create test files and show all functions"

# 1️⃣ 列出文件/目录并按大小排序
sort_file:
	@echo "Listing all files/directories sorted by size..."
	@ls -lhS
	@echo "Done."

# 2️⃣ 查找 .log 文件
find_log:
	@echo "Finding all .log files in $(HOME)..."
	@find $(HOME) -type f -name "*.log"
	@echo "Done."

# 3️⃣ 查找并删除 .lock 文件
delete_lock_file:
	@echo "Deleting all .lock files in $(HOME)..."
	@find $(HOME) -type f -name "*.lock" -exec rm -f {} \;
	@echo "All .lock files have been deleted."

# 4️⃣ demo：自动生成测试文件并展示所有功能
demo:
	@echo "Creating dummy files..."
	@touch $(HOME)/demo1.log $(HOME)/demo2.log $(HOME)/demo1.lock $(HOME)/demo2.lock
	@dd if=/dev/zero of=small_file.txt bs=1K count=5 2>/dev/null
	@dd if=/dev/zero of=big_file.txt bs=1K count=100 2>/dev/null
	@echo "Running sort_file:"
	@make sort_file
	@echo
	@echo "Running find_log:"
	@make find_log
	@echo
	@echo "Running delete_lock_file:"
	@make delete_lock_file
	@echo
	@echo "Demo completed!"
