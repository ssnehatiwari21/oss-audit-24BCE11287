#!/bin/bash
# Script 4: Log File Analyzer
# Author: Sneha Tiwari | Reg No: 24BCE11287
# Course: Open Source Software
# ─── Arguments ───────────────────────────────────────────────
LOGFILE=$1                  # First argument: path to the log file
KEYWORD=${2:-"error"}       # Second argument: keyword to search (default: "error")
COUNT=0                     # Counter for matching lines
MAX_RETRIES=3               # Max number of retries if file is empty
ATTEMPT=1                   # Current retry attempt number

# ─── Validate that a file argument was provided ──────────────
if [ -z "$LOGFILE" ]; then
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# ─── Check that the file exists ──────────────────────────────
if [ ! -f "$LOGFILE" ]; then
    echo "  Error: File '$LOGFILE' not found. Please check the path."
    exit 1
fi

# ─── do-while style retry loop if file is empty ──────────────
# Bash doesn't have a native do-while, so we simulate it with
# a while loop that always runs at least once using a flag.
while true; do
    # Check if the file has any content (size > 0)
    if [ -s "$LOGFILE" ]; then
        # File has content — break out of retry loop and proceed
        break
    else
        echo "  Warning: '$LOGFILE' appears to be empty. (Attempt $ATTEMPT of $MAX_RETRIES)"

        # If we've hit the max retries, exit gracefully
        if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
            echo "  File is still empty after $MAX_RETRIES attempts. Exiting."
            exit 1
        fi

        # Increment attempt counter and wait 2 seconds before retrying
        ATTEMPT=$((ATTEMPT + 1))
        sleep 2
    fi
done

# ─── Header ──────────────────────────────────────────────────
echo "=================================================="
echo "           Log File Analyzer"
echo "=================================================="
echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""

# ─── Read file line by line using while-read loop ────────────
# IFS= preserves leading/trailing whitespace in each line
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive with -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment match counter
    fi
done < "$LOGFILE"   # Redirect file into the while loop (not a subshell)

# ─── Print summary ───────────────────────────────────────────
echo "  Result: Keyword '$KEYWORD' was found $COUNT time(s) in $LOGFILE"
echo ""

# ─── Print last 5 matching lines ─────────────────────────────
# Combine grep (to filter matches) and tail (to get last 5 of those matches)
echo "  Last 5 lines containing '$KEYWORD':"
echo "  -------------------------------------"

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    # No matches found — inform the user
    echo "  (No lines matched '$KEYWORD' in this file.)"
else
    # Print last 5 matching lines using tail
    echo "$MATCHES" | tail -5
fi

echo ""
echo "=================================================="
