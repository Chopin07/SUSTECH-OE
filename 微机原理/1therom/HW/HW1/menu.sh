#!/bin/bash

while true; do
    clear
    echo "=========================================="
    echo "        Raspberry Pi Shell Menu"
    echo "=========================================="
    echo "a. List all files in the current directory"
    echo "b. Display today's date and time"
    echo "c. Check if a file is a simple file or directory"
    echo "d. Create a backup for a file (tar)"
    echo "e. Compress the tar file"
    echo "f. Start an FTP session"
    echo "g. Start your LED control program"
    echo "h. Display system info (CPU, memory, temp)"
    echo "i. Show current logged-in user"
    echo "j. Show network IP address"
    echo "k. Show disk space usage"
    echo "l. Schedule an automatic backup (cron demo)"
    echo "x. Exit"
    echo "------------------------------------------"
    read -p "Enter your choice: " choice
    echo "------------------------------------------"

    case $choice in
        a)
            # 显示当前目录下的所有文件和权限信息
            echo "Listing all files in $(pwd):"
            ls -lh
            ;;
        b)
            # 显示系统日期与时间
            echo "Today's date and time:"
            date
            ;;
        c)
            # 判断输入的是普通文件还是目录
            read -p "Enter file/directory name: " filename
            if [ -f "$filename" ]; then
                echo "$filename is a simple file."
            elif [ -d "$filename" ]; then
                echo "$filename is a directory."
            else
                echo "$filename does not exist."
            fi
            ;;
        d)
            # 通过 tar 命令创建文件或文件夹的备份
            read -p "Enter file/directory to backup: " target
            tar -cvf backup_$(basename "$target")_$(date +%Y%m%d).tar "$target"
            echo "Backup created successfully."
            ;;
        e)
            # 压缩 tar 文件
            read -p "Enter the tar file name to compress: " tarfile
            gzip "$tarfile"
            echo "Compression done. Created file: $tarfile.gz"
            ;;
        f)
            # 启动 FTP 会话
            read -p "Enter FTP domain or IP: " server
            echo "Starting FTP session to $server ..."
            ftp "$server"
            ;;
        g)
            # 启动树莓派LED控制程序
            echo "Starting LED control program..."
            # 示例路径：替换为你自己的LED控制脚本路径
            sudo python3 ~/Desktop/LED/LED.py
            ;;
        h)
            # 查看系统信息：CPU、内存、温度
            echo "System Information:"
            echo "------------------"
            echo "CPU Load:"
            uptime
            echo
            echo "Memory Usage:"
            free -h
            echo
            echo "CPU Temperature:"
            vcgencmd measure_temp
            ;;
        i)
            # 显示当前登录用户名
            echo "Current user: $(whoami)"
            ;;
        j)
            # 显示本机IP地址
            echo "Your IP addresses are:"
            hostname -I
            ;;
        k)
            # 显示磁盘使用情况
            echo "Disk space usage:"
            df -h
            ;;
        x)
            # 退出菜单
            echo "Exiting program. Bye!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    echo
    read -p "Press Enter to continue..." temp
done
