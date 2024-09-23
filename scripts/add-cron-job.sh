#!/bin/bash

# Function to validate input is a number (allowing * and ranges like */8)
validate_number() {
    if ! [[ "$1" =~ ^[0-9]+$ ]] && ! [[ "$1" =~ ^\*\/[0-9]+$ ]] && ! [[ "$1" == "*" ]]; then
        echo "Invalid input. Please enter a valid number."
        exit 1
    fi
}

# Prompt for minutes, hours, days, months, and days of the week
echo "Enter the time values for when you want the script to run (press Enter for default value 0 for minute and */8 for hour):"
read -p "Minute (0-59, * for every minute, default 0): " minute
minute=${minute:-0} # Default to 0 if empty

read -p "Hour (0-23, * for every hour, default */8 for every 8 hours): " hour
hour=${hour:-'*/8'} # Default to */8 if empty

read -p "Day of the month (1-31, * for every day, default *): " day_of_month
day_of_month=${day_of_month:-*} # Default to * if empty

read -p "Month (1-12, * for every month, default *): " month
month=${month:-*} # Default to * if empty

read -p "Day of the week (0-7, where 0 and 7 are Sunday, * for every day, default *): " day_of_week
day_of_week=${day_of_week:-*} # Default to * if empty

# Validate inputs (including wildcards and ranges)
validate_number "$minute"
validate_number "$hour"
validate_number "$day_of_month"
validate_number "$month"
validate_number "$day_of_week"

# Prompt for the script path
read -p "Enter the full path of the script you want to schedule: " script_path

# Check if the file exists and is executable
if [ ! -f "$script_path" ]; then
    echo "The file does not exist. Please check the path."
    exit 1
fi

if [ ! -x "$script_path" ]; then
    echo "The file is not executable. Making it executable now."
    chmod +x "$script_path"
fi

# Create the cron job line
cron_job="$minute $hour $day_of_month $month $day_of_week $script_path"

# Add the cron job to the user's crontab
(
    crontab -l 2>/dev/null
    echo "$cron_job"
) | crontab -

echo "The following cron job has been added:"
echo "$cron_job"
