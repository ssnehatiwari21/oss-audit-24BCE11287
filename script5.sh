#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Sneha Tiwari | Reg No: 24BCE11287
# Course: Open Source Software
# ─── Header ──────────────────────────────────────────────────
echo "=================================================="
echo "       Open Source Manifesto Generator"
echo "         Powered by Git & GNU Bash"
echo "=================================================="
echo ""
echo "  Answer three questions to generate your personal"
echo "  open-source philosophy statement."
echo ""

# ─── Interactive user input using read ───────────────────────
# -p flag displays the prompt on the same line as the input cursor
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# ─── Validate that the user actually entered something ───────
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  Error: All three answers are required. Please re-run the script."
    exit 1
fi

# ─── Date and output file setup ──────────────────────────────
DATE=$(date '+%d %B %Y')                      # Formatted date e.g. 26 March 2026
OUTPUT="manifesto_$(whoami).txt"              # Output filename includes the username

# ─── String concatenation to build the manifesto ─────────────
# Each echo >> appends a new line to the output file
# The > operator is used first to create/overwrite the file cleanly

# Write the manifesto title and metadata to the file
echo "==================================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO"                  >> "$OUTPUT"
echo "  Generated on : $DATE"                             >> "$OUTPUT"
echo "  Author       : $(whoami)"                         >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"

# String concatenation happens naturally as variables are embedded in the echo strings
echo "  Every day, I rely on $TOOL — a tool that exists"         >> "$OUTPUT"
echo "  not because someone wanted to profit from it, but"       >> "$OUTPUT"
echo "  because a community believed that $FREEDOM should"       >> "$OUTPUT"
echo "  not be locked behind a paywall or a proprietary wall."   >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  Open source taught me that the most powerful things"     >> "$OUTPUT"
echo "  are built in the open. That is why I commit to one day"  >> "$OUTPUT"
echo "  sharing $BUILD freely — so that someone else can build"  >> "$OUTPUT"
echo "  on top of it, improve it, and pass it forward."          >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  Like Git, which Linus Torvalds built and gave to the"    >> "$OUTPUT"
echo "  world under the GPL, I believe that knowledge grows"     >> "$OUTPUT"
echo "  stronger when it is shared, not hoarded."                >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "  Freedom in software means $FREEDOM — and that is"        >> "$OUTPUT"
echo "  worth protecting, contributing to, and passing on."      >> "$OUTPUT"
echo ""                                                           >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"
echo "  'Given enough eyeballs, all bugs are shallow.'"  >> "$OUTPUT"
echo "           — Eric S. Raymond, The Cathedral"       >> "$OUTPUT"
echo "             and the Bazaar"                       >> "$OUTPUT"
echo "==================================================" >> "$OUTPUT"

# ─── Confirm save and display the manifesto ──────────────────
echo "  ✔ Manifesto saved to: $OUTPUT"
echo ""
echo "  Here is your manifesto:"
echo ""

# cat reads and prints the file content to the terminal
cat "$OUTPUT"
