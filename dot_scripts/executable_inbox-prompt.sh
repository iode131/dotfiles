#!/bin/bash
input=$(zenity --entry --title="Inbox" --text="Capture:")
[ -n "$input" ] && echo "- $(date '+%Y-%m-%d') $input" >> ~/Brain/00-inbox/inbox.md
