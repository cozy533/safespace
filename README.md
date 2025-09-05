# safespace 📝🔒

A personal diary management tool written in Bash. It lets you write entries (in nano by default), organize them by date, and securely archive them in a password-protected 7z archive.

## Scripts

### `write-diary-entry.sh`

- Begins a new diary entry if none exists for the current day, or continues an existing one
- Default filename: `MM-DD-YYYY` (option to append a custom title)  
- Uses `nano` for editing, but easily changeable

### `add-diary-entry.sh`

- Archives all diary entries into a password-protected `Diary.7z`  
- Prompts for password for encryption  
- Shows the 3 most recently updated entries from the archive for verification
- Offers to delete the original entries after archiving  

## Installation

1. Clone the repository: <br>
`git clone https://github.com/cozy533/safespace && cd safespace`

2. Make the scripts executable: <br>
`chmod +x write-diary-entry.sh add-diary-entry.sh`

3. Optional: move the scripts to a directory in your `PATH` for easy access: <br>
`sudo mv write-diary-entry.sh add-diary-entry.sh /usr/local/bin/`

## Usage

- Write an entry: <br>
`.write-diary-entry.sh`

- Add unarchived entries to `Diary.7z`: <br>
`./add-diary-entry.sh`

⚠️ These scripts are designed for personal use; modify `ENTRY_DIR` and `WORKING_DIR` in the scripts if your paths differ.
⚠️ Please remember to keep your archive password safe, and always keep a backup of `Diary.7z`.
