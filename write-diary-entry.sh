#!/bin/bash

#
# Script to write diary entries.
# Creates a new file if entry doesn't exist yet.
# If entry already exists, resumes writing in the existing one.
# File name defaults to "M-D-YYYY", but asks if title should be appended after writing.
#

set -e

YEAR=$(date +%Y)
MONTH=$(date +%m)
MONTH_SHORT=$(date +%b)
DAY=$(date +%d)

ENTRY_FILENAME="${MONTH}-${DAY}-${YEAR}"
ENTRY_DIR="/mnt/storage/docs/diary/${YEAR}/${MONTH}-${MONTH_SHORT}"
WORKING_DIR="/mnt/storage/docs/diary/"

cd "${WORKING_DIR}"

if [ ! -d "${ENTRY_DIR}" ]; then
	mkdir -p "${ENTRY_DIR}"
fi

nano "${ENTRY_DIR}/${ENTRY_FILENAME}"
#gnome-text-editor 2>/dev/null "${ENTRY_DIR}/${ENTRY_FILENAME}"

echo -e -n "\033[0;33mAdd title? (y/N): \033[0;0m"
read choice

case $choice in

	Y | y)
		echo -e -n "\033[0;33mEnter title: "
		read title
		NEW_TITLE="${MONTH}-${DAY}-${YEAR}_${title}"

		mv "${ENTRY_DIR}/${ENTRY_FILENAME}" "${ENTRY_DIR}/${NEW_TITLE}"
		echo -e "\033[0;32mRenamed ${ENTRY_FILENAME} to ${NEW_TITLE}\033[0;0m"
		;;

	*)
		;;
esac

if [[ "$choice" == "Y" ]] || [[ "$choice" == "y" ]]; then
	echo -e -n "\033[0;33mAdd entries to Diary? (Y/n): \033[0;0m"
	read add

	case $add in

		N | n)
			;;

		*)
			bash  "${HOME}/docs/scripts/diary/add-diary-entry.sh"
			;;
	esac
fi
