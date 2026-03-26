#!/bin/bash
# Script 1: System Identity Report
# Author: Sneha Tiwari | Reg No: 24BCE11287
# Course: Open Source Software
# ─── Variables ───────────────────────────────────────────────
STUDENT_NAME="Sneha Tiwari"          
SOFTWARE_CHOICE="Git"               
# Gather system information using command substitution
KERNEL=$(uname -r)                   # Linux kernel version
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Distro name
USER_NAME=$(whoami)                  # Currently logged-in user
HOME_DIR=$HOME                       # Home directory of current user
UPTIME=$(uptime -p)                  # Human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y, %I:%M %p')   # Formatted date and time

# ─── Display Header ──────────────────────────────────────────
echo "=================================================="
echo "        Open Source Audit — $STUDENT_NAME"
echo "        Chosen Software  : $SOFTWARE_CHOICE"
echo "=================================================="
echo ""

# ─── System Information ──────────────────────────────────────
echo "  Linux Distribution : $DISTRO"
echo "  Kernel Version     : $KERNEL"
echo "  Logged-in User     : $USER_NAME"
echo "  Home Directory     : $HOME_DIR"
echo "  System Uptime      : $UPTIME"
echo "  Current Date/Time  : $CURRENT_DATE"
echo ""
# ─── License Information ─────────────────────────────────────
# The Linux kernel is licensed under GPL v2 (GNU General Public License version 2)
# This means the OS itself is free and open-source software
echo "  OS License         : GNU General Public License v2 (GPL v2)"
echo "  This means you are free to run, study, modify, and"
echo "  redistribute this operating system and its source code."
echo ""
# ─── Git-specific note ───────────────────────────────────────
# Git is also licensed under GPL v2 — same as the Linux kernel
echo "  Audit Target       : $SOFTWARE_CHOICE (Licensed under GPL v2)"
echo "  Git was created by Linus Torvalds in 2005 when the"
echo "  proprietary BitKeeper VCS revoked free access to the"
echo "  Linux kernel development community."
echo ""
echo "=================================================="
echo "  'Free as in freedom, not just free as in beer.'"
echo "           — Richard Stallman, GNU Project"
echo "=================================================="
