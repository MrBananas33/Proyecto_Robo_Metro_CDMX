#!/bin/zsh

# Script to list all files with detailed information in the current directory
# and save the results to file_details.txt

echo "Generating detailed file listing for directory: $(pwd)"
echo "This will be saved to file_details.txt"

# Use ls command with options:
# -l: long format with permissions, owner, size, date
# -a: include hidden files
# -h: human-readable file sizes
# -T: display complete time information

# Create the file with header first
{
  echo "Detailed file listing generated on $(date)"
  echo "Current directory: $(pwd)"
  echo ""
  # Then append the ls output
  ls -lahT
} > file_details.txt

echo "Detailed file listing has been saved to file_details.txt"

# Make the script executable
chmod +x "${0:A}"

