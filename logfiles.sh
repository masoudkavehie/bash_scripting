#!/bin/bash

log_file="/var/log/syslog"
filtered_log_file="filtered_log.txt"
error_message="kubectl"

# Function to filter log file based on error message
filter_log() {
    grep -i "$error_message" "$log_file" > "$filtered_log_file"
}

# Function to count the number of errors in filtered log
count_errors() {
    error_count=$(wc -l < "$filtered_log_file")
    echo "Number of errors: $error_count"
}

# Interactive menu using select and case
PS3="Please enter your choice: "

select option in "Filter log" "Count errors" "Quit"; do
    case $option in
        "Filter log")
            filter_log
            echo "Log filtered successfully."
            ;;
        "Count errors")
            count_errors
            ;;
        "Quit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
