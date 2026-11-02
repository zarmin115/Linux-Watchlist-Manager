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

- **Add Titles:** Add movies and web series to the watchlist.
- **Track Watching Status:** Mark titles as watched and record ratings.
- **Genre-Based Recommendations:** Find recommendations based on genre.
- **Average Rating:** Calculate the average rating of watched titles.
- **Data Backup:** Create dated backups and compressed TAR.GZ archives.
- **Activity Logging:** Maintain a record of project activities.
- **Weekend Picks:** Generate recommendations for unwatched titles.

## Technologies and Commands Used

- **Linux / Ubuntu (WSL):** Operating environment.
- **Bash Shell Scripting:** Application development.
- **grep:** Search for matching text.
- **sed:** Modify text and data.
- **awk:** Process data and perform calculations.
- **sort:** Sort information.
- **tar:** Create compressed backups.
- **cron:** Schedule recurring tasks.

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
2. Navigate to the project directory:

   ```bash
   cd ~/linux_project/watchlist
   ```

3. Give execution permission to the main script:

   ```bash
   chmod +x main.sh
   ```

4. Run the application:

   ```bash
   ./main.sh
   ```

5. Follow the menu options displayed in the terminal to manage the watchlist.

## Learning Outcomes

This project provides practical experience with Linux commands, Bash scripting, CSV file handling, text processing, file management, activity logging, backups, and automation.

## Project Guide

This project was completed under the guidance of:

**Dr. Anjum Y. Mansuri**  
Assistant Professor, Computer Applications  
LJ Institute of Computer Applications, LJ University, Ahmedabad.

GitHub: [@anjum-mansuri](https://github.com/anjum-mansuri)

## Course and Project Details

- **Course:** OS Linux Lab 260120510
- **Project ID:** L11
- **Project Name:** Watchlist Manager
- **Division:** G
- **Roll Number:** 24004501210415
- **Enrollment Number:** 24004501210415

## Author

**Name:** Zarmin Shaikh

## GitHub Repository

[Linux Watchlist Manager](https://github.com/zarmin115/Linux-Watchlist-Manager)
