#!/bin/bash

#
# Script for adding new entries into Diary.7z.
# Also displays the 3 most recently updated entries for verification.
# Asks to delete unarchived entries from "in Progress" folder afterward.
#

set -e
cd "/mnt/storage/docs/diary/"

echo -e "\nEntries about to be added:"
for entry in */*/*; do
	echo "${entry}"
done

echo -e -n "\nEnter Diary password: "
read -s pw

for dir in */; do
	7z a -p${pw} Diary.7z ${dir} >/dev/null
done

echo -e "\033[0;32m\nSuccessfully added entries.\033[0;0m"
echo -e "\nThe 3 most recently updated entries are:\n"

# Output full filenames only, from 7z list command
7z l -p${pw} Diary.7z | tail -n 5 | head -n 3 | awk '{print $NF}'
echo -e -n "\033[0;33m\nDelete entries? (y/N): \033[0;0m"
read choice

case $choice in

	Y | y)
		for entry in */*/*; do
			echo -e "\033[0;33mDeleting entry: ${entry}"
			rm ${entry}
		done
		;;

	*)
		echo -e "\033[0;33mNo entries were deleted."
		;;
esac

echo -e "\033[0;32mOperation complete.\033[0;0m"
