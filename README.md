# DuckDNS
Duck DNS crontab script

## Prerequisites
- bash
- crontab
- sponge 
  - Debian: `sudo apt-get install moreutils`
  - Fedora: `sudo yum install moreutils`
  
## Setup
**NOTE**: This setup is similar to the instructions provided by Duck DNS (https://www.duckdns.org/install.jsp?tab=linux-cron)
1. Download duck.sh script and place it in a desired location. For the sake of this setup, `/DuckDNS/duck.sh` will be used.
2. Update script to provide `DOMAINS` and `TOKEN` based on your Duck DNS information. Also update `LOG_FILE` and `LOG_LENGTH` to desired log location and log max line count respectively.
3. Make script executable
   - `chmod 700 duck.sh`
4. Add script to crontab
   - `crontab -e`
   - `*/5 * * * * ~/DuckDNS/duck.sh >/dev/null 2>&1`
5. Success!
