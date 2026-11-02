# Linux Watchlist Manager 🎬

## Project Overview
Linux Watchlist Manager is a terminal-based application developed using Bash scripting and Linux commands. It helps users manage a personal movie and web-series watchlist through a simple menu-driven interface.

## Objectives
- To learn Linux commands and Bash shell scripting.
- To add and organize movie and web-series details.
- To track watching status and ratings.
- To practice searching, filtering, sorting, logging, and file management.
- To understand backups and scheduled tasks in Linux.

## Features
- Add movies and web series to the watchlist.
- Mark titles as watched and record ratings.
- Get recommendations based on genre.
- Calculate average ratings.
- Create dated backups and compressed archives.
- Maintain an activity log.
- Generate weekend recommendations for unwatched titles.

## Technologies and Commands Used
- Linux / Ubuntu (WSL)
- Bash Shell Scripting
- `grep` – search for matching text
- `sed` – modify text and data
- `awk` – process data and calculate values
- `sort` – sort information
- `tar` – create compressed backups
- `cron` – schedule recurring tasks

## Project Structure
```text
watchlist/
├── main.sh
├── README.md
├── data/
│   └── watchlist.csv
├── lib/
│   └── functions.sh
├── logs/
│   └── activity.log
├── backups/
├── reports/
└── weekend_picks.txt
```

## How to Run
1. Open the Ubuntu terminal.
2. Navigate to the project folder:

   ```bash
   cd ~/linux_project/watchlist
   ```

3. Give execution permission:

   ```bash
   chmod +x main.sh
   ```

4. Start the application:

   ```bash
   ./main.sh
   ```

5. Follow the menu options displayed in the terminal.

## Learning Outcomes
This project provides practical experience with Linux commands, Bash scripting, CSV file handling, data processing, activity logging, backup management, and automation.

## Project Guide
This project was completed under the guidance of  
**Dr. Anjum Y. Mansuri**, Assistant Professor, Computer Applications,  
LJ Institute of Computer Applications, LJ University, Ahmedabad.

GitHub: [@anjum-mansuri](https://github.com/anjum-mansuri)

## Course and Project Details
**Course:** OS Linux Lab 260120510  
**Project ID:** L11  
**Project Name:** Watchlist Manager

## Author
**Zarmin Shaikh**
