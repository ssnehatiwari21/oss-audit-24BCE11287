# OSS Audit — Git
**Student Name:** Sneha Tiwari
**Roll Number:**  24BCE11287
**Chosen Software:** Git

## About This Project
This project is a structured audit of Git, an open-source
version control system licensed under GPL v2, created by
Linus Torvalds in 2005.

## Scripts Overview
| Script | Description |
|--------|-------------|
| script1_system_identity.sh | Displays system info, kernel version, uptime and OS license |
| script2_package_inspector.sh | Checks if Git is installed and shows package details |
| script3_disk_permission_auditor.sh | Audits permissions and disk usage of key directories |
| script4_log_analyzer.sh | Searches a log file for keywords and counts matches |
| script5_manifesto_generator.sh | Generates a personalised OSS philosophy statement |

## Dependencies
- Bash (v4.0 or above)
- Git
- Standard Linux utilities: uname, whoami, uptime, df, du, grep, awk

## How to Run

### Step 1 — Clone the repository
git clone https://github.com/yourusername/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]

### Step 2 — Give execute permission
chmod +x *.sh

### Step 3 — Run each script
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_permission_auditor.sh
./script4_log_analyzer.sh /var/log/dpkg.log error
./script5_manifesto_generator.sh
