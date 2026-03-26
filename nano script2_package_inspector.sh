#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Sneha Tiwari | Reg No: 24BCE11287
# Course: Open Source Software
# ─── Variable ────────────────────────────────────────────────
PACKAGE="git"   # The open-source package we are auditing
# ─── Check if package is installed ──────────────────────────
# Try rpm first (for Fedora/RHEL/CentOS), then dpkg (for Debian/Ubuntu)
echo "=================================================="
echo "        FOSS Package Inspector — $PACKAGE"
echo "=================================================="
echo ""
if command -v rpm &>/dev/null; then
    # RPM-based system (Fedora, RHEL, CentOS)
    if rpm -q $PACKAGE &>/dev/null; then
        echo "  ✔ '$PACKAGE' is installed on this system (RPM)."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # Use grep with pipe to extract only the important fields
        rpm -qi $PACKAGE | grep -E 'Name|Version|License|Summary|URL'
    else
        echo "  ✘ '$PACKAGE' is NOT installed."
        echo "  To install, run: sudo dnf install git"
    fi
elif command -v dpkg &>/dev/null; then
    # DEB-based system (Ubuntu, Debian)
    if dpkg -l $PACKAGE &>/dev/null 2>&1 | grep -q "^ii"; then
        echo "  ✔ '$PACKAGE' is installed on this system (DEB)."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # dpkg -s gives full package status and info
        dpkg -s $PACKAGE | grep -E 'Package|Version|License|Description'
    else
        echo "  ✘ '$PACKAGE' is NOT installed."
        echo "  To install, run: sudo apt install git"
    fi

else
    # Fallback: just check if the git command is available
    if command -v git &>/dev/null; then
        echo "  ✔ '$PACKAGE' is available on this system."
        echo "  Version: $(git --version)"
    else
        echo "  ✘ '$PACKAGE' is NOT installed or not in PATH."
    fi
fi

echo ""
# ─── Philosophy note using case statement ────────────────────
# Each package name maps to a one-line philosophy note about its OSS values
echo "  OSS Philosophy Note:"
echo "  --------------------"
case $PACKAGE in
    git)
        echo "  Git: Born from necessity — Linus built it in 2 weeks when"
        echo "  proprietary tools failed the Linux community. GPL v2 ensures"
        echo "  it stays free for every developer, forever."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Apache 2.0 license lets companies use it freely while"
        echo "  still protecting contributors' work."
        ;;
    mysql)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual GPL/commercial license sparked important debates"
        echo "  about what 'open source' truly means for businesses."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who just wanted to watch"
        echo "  video on their campus network. LGPL ensures it stays open"
        echo "  and plays anything, on any platform."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's answer to browser monopoly."
        echo "  MPL 2.0 lets anyone contribute while keeping the core"
        echo "  code open — a browser truly built for users, not profit."
        ;;
    python3|python)
        echo "  Python: A language shaped entirely by its community."
        echo "  The PSF license is one of the most permissive in OSS —"
        echo "  use it anywhere, build anything, share what you learn."
        ;;
    *)
        # Default case if the package name doesn't match any known entry
        echo "  '$PACKAGE' is an open-source tool. Check its LICENSE file"
        echo "  to understand what freedoms it grants you."
        ;;
esac

echo ""
echo "=================================================="
