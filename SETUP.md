# Claude Conversation Splitter — Setup Instructions

This script takes the single monolithic JSON file from claude.ai's **Export
data** feature and splits it into individual, readable Markdown files — one
per conversation — including any diagrams Claude generated during the chat.

No third-party packages are required. Everything the script uses is part of
the Python standard library.

## 1. Install Python

If you don't already have Python installed:

1. Go to https://www.python.org/downloads/ and download the latest Python 3
   installer for your OS.
2. Run the installer.
   - **Windows:** on the first screen of the installer, check the box
     labeled **"Add python.exe to PATH"** before clicking Install. This is
     the step people most often miss, and it's what lets you type `python`
     from any folder in a command prompt instead of typing the full path
     to python.exe every time.
   - **Mac/Linux:** Python 3 is often preinstalled. Open a terminal and run
     `python3 --version` to check. If it's missing, use the installer above,
     or your system's package manager (e.g. `brew install python3` on Mac).
3. Confirm it worked: open a new command prompt / terminal window (must be a
   *new* window if Python was just installed, so it picks up the updated
   PATH) and run:
   ```
   python --version
   ```
   You should see something like `Python 3.x.x`. (On Mac/Linux this may
   need to be `python3` instead of `python`.)

## 2. Get the export file

In claude.ai: **Settings → Account → Export data** (or similar path,
depending on current UI). You'll receive a download link by email for a
`.json` file containing all your conversations.

## 3. Run the script

1. Put `split_convos.py` and your exported `conversations.json` file in the same folder.  
   NOTE: the Exported package will contain several JSON files;
         the one you want to split is `conversations.json`.
2. Open a command prompt / terminal in that folder and run:
   ```
   python split_convos.py conversations.json
   ```  
   (or `python3 split_convos.py conversations.json on Mac/Linux)`
   
3. You should see a list of generated `.md` filenames printed out. Any
   diagrams Claude generated during those conversations will also be saved
   alongside the `.md` files as `.svg` files, already linked from the
   Markdown.

## Notes

- If a conversation included an image *you* uploaded (a photo, screenshot,
  etc.), the export does not include the actual image file — only its
  original filename. The script will insert a Markdown image link using
  that filename and a note reminding you to save the image yourself
  (from claude.ai) into the same folder.
- This script depends on the structure of claude.ai's export format as of
  mid-2026. If Anthropic changes that format later, the script may need
  small updates to match.
