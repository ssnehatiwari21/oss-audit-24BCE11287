#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Sneha Tiwari | Reg No: 24BCE11287
# Course: Open Source Software
# ─── List of important system directories to audit ───────────
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
# ─── Header ──────────────────────────────────────────────────
echo "=================================================="
echo "         Disk and Permission Auditor"
echo "=================================================="
echo ""
echo "  Directory Audit Report"
echo "  ----------------------"
# ─── For loop through each directory ─────────────────────────
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists before inspecting it
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using awk on ls -ld output
        # ls -ld gives a single line for the directory itself (not its contents)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')    # e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')    # e.g. root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')    # e.g. root

        # du -sh gives human-readable size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  Directory : $DIR"
        echo "  Size      : $SIZE"
        echo "  Perms     : $PERMS  |  Owner: $OWNER  |  Group: $GROUP"
        echo "  ------------------------------------------------"
    else
        # Directory doesn't exist on this system — print a note
        echo "  [SKIP] $DIR does not exist on this system."
        echo "  ------------------------------------------------"
    fi
done

echo ""
# ─── Git-specific config directory check ─────────────────────
# Git stores its system-wide config at /etc/gitconfig
# and user-level config at ~/.gitconfig
echo "  Git Configuration Files"
echo "  -----------------------"

GIT_SYSTEM_CONFIG="/etc/gitconfig"
GIT_USER_CONFIG="$HOME/.gitconfig"
GIT_GLOBAL_DIR="$HOME/.config/git"

# Check system-wide gitconfig
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  ✔ System config  : $GIT_SYSTEM_CONFIG"
    echo "    Permissions    : $PERMS"
else
    echo "  ✘ System config  : $GIT_SYSTEM_CONFIG not found."
fi

echo ""

# Check user-level gitconfig
if [ -f "$GIT_USER_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    echo "  ✔ User config    : $GIT_USER_CONFIG"
    echo "    Permissions    : $PERMS"
else
    echo "  ✘ User config    : $GIT_USER_CONFIG not found."
    echo "    (Run 'git config --global user.name \"Name\"' to create it.)"
fi
echo ""
# Check ~/.config/git directory (newer Git versions use this)
if [ -d "$GIT_GLOBAL_DIR" ]; then
    PERMS=$(ls -ld "$GIT_GLOBAL_DIR" | awk '{print $1, $3, $4}')
    echo "  ✔ Global git dir : $GIT_GLOBAL_DIR"
    echo "    Permissions    : $PERMS"
else
    echo "  ✘ Global git dir : $GIT_GLOBAL_DIR not found."
fi
echo ""
echo "=================================================="
echo "  Why permissions matter:"
echo "  Config files contain user identity info used in"
echo "  every commit. Wrong permissions could let other"
echo "  users on the same system read or modify them."
echo "=================================================="
