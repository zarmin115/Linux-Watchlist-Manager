#!/bin/bash
# ============================================================
#  STARTER KIT – L11 Watchlist Manager
#  Student: ZARMIN SHAIKH  Roll: F07  Div: G
#  Run:  bash setup_watchlist.sh
#  It creates ~/linux_project/watchlist with folders, sample data and scripts.
# ============================================================
P="$HOME/linux_project/watchlist"
if [ -d "$P" ]; then echo "Folder $P already exists. Rename or delete it first."; exit 1; fi
mkdir -p "$P"/lib "$P"/data "$P"/reports "$P"/backups "$P"/logs
cd "$P" || exit 1

# sample data: data/watchlist.csv
cat > 'data/watchlist.csv' <<'KIT_DATA_0'
title,type,genre,status,rating
Kota Factory,Series,Drama,watched,9
Dune Part Two,Movie,Sci-Fi,pending,
KIT_DATA_0

cat > lib/functions.sh <<'KIT_FUNCS'
#!/bin/bash
# lib/functions.sh – all functions for Watchlist Manager
DATA="data/watchlist.csv"

LOG="logs/activity.log"

# write one line to the activity log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG"
}

# check the data file / folder exists before using it
check_data() {
    if [ ! -e "$DATA" ]; then
        echo "Data not found: $DATA"
        return 1
    fi
}

show_help() {
    echo "Usage: ./main.sh            -> open the menu"
    echo "       ./main.sh --help     -> show this help"
    echo "       ./main.sh --backup   -> backup data/ now"
    echo "       ./main.sh --cron     -> run the scheduled (crontab) task"
}

view_data() {
    check_data || return
    if [ -d "$DATA" ]; then ls -l "$DATA"; else cat -n "$DATA" | more; fi
}

do_backup() {
    f="backups/data_$(date +%Y%m%d_%H%M%S).tar.gz"
    tar -czf "$f" data/
    echo "Backup saved: $f ($(du -h "$f" | cut -f1))"
    log "backup created $f"
}

view_log() {
    if [ -f "$LOG" ]; then tail -n 15 "$LOG"; else echo "No activity yet."; fi
}

# ------------------------------------------------------------
# FEATURE 1: Add a title
# Commands you can use: sed, awk, grep, sort, tar
# ------------------------------------------------------------
feature_1() {
    echo "== Add a title =="
    echo "TODO: write the code for this feature (see your project guide, Step 3)."
    # ---- example to start from (remove the # and change it) ----
    # read -p "Enter title: " v1
    # read -p "Enter type: " v2
    # # ...ask for every column: title, type, genre, status, rating
    # if [ -z "$v1" ]; then echo "Value cannot be empty"; return; fi
    # echo "$v1,$v2" >> "$DATA"        # add all 5 values in the same order as the header
    # echo "Saved!"
    log "feature_1 used"
}

# ------------------------------------------------------------
# FEATURE 2: Mark as watched and give a rating (sed)
# Commands you can use: sed, awk, grep, sort, tar
# ------------------------------------------------------------
feature_2() {
    echo "== Mark as watched and give a rating (sed) =="
    echo "TODO: write the code for this feature (see your project guide, Step 4)."
    # ---- example to start from (remove the # and change it) ----
    # read -p "Enter title to change: " key
    # if ! grep -q "^$key," "$DATA"; then echo "Not found"; return; fi
    # # change the last column of that row (example)
    # sed -i "/^$key,/s/[^,]*$/NEW_VALUE/" "$DATA"
    # echo "Updated:"; grep "^$key," "$DATA"
    log "feature_2 used"
}

# ------------------------------------------------------------
# FEATURE 3: Recommend unwatched titles by genre
# Commands you can use: sed, awk, grep, sort, tar
# ------------------------------------------------------------
feature_3() {
    echo "== Recommend unwatched titles by genre =="
    echo "TODO: write the code for this feature (see your project guide, Step 5)."
    # ---- example to start from (remove the # and change it) ----
    # read -p "Search for: " word
    # grep -i "$word" "$DATA" || echo "Nothing found"
    # # or show selected columns: awk -F',' '{ print $1, $2 }' "$DATA"
    log "feature_3 used"
}

# ------------------------------------------------------------
# FEATURE 4: Average rating per genre
# Commands you can use: sed, awk, grep, sort, tar
# ------------------------------------------------------------
feature_4() {
    echo "== Average rating per genre =="
    echo "TODO: write the code for this feature (see your project guide, Step 6)."
    # ---- example to start from (remove the # and change it) ----
    # # example: total and average of column 5 (rating); change $5 if you need another column
    # awk -F',' 'NR>1 { sum += $5; n++ }
    # END { if (n>0) printf "Total: %.2f  Average: %.2f\n", sum, sum/n }' "$DATA"
    # # for decimals in bash use bc, e.g.: echo "scale=2; 45/60" | bc
    log "feature_4 used"
}

# ------------------------------------------------------------
# FEATURE 5: Backup the watchlist with date stamp
# Commands you can use: sed, awk, grep, sort, tar
# ------------------------------------------------------------
feature_5() {
    echo "== Backup the watchlist with date stamp =="
    echo "TODO: write the code for this feature (see your project guide, Step 7)."
    # ---- example to start from (remove the # and change it) ----
    # read -p "Search for: " word
    # grep -i "$word" "$DATA" || echo "Nothing found"
    # # or show selected columns: awk -F',' '{ print $1, $2 }' "$DATA"
    log "feature_5 used"
}

# ------------------------------------------------------------
# CRON TASK: Every Saturday at 7 PM, write 3 random unwatched recommendations to weekend_picks.txt
# Runs when crontab calls:  ./main.sh --cron
# ------------------------------------------------------------
cron_task() {
    # TODO: write the code for the scheduled task here (Step 10 of your guide)
    echo "$(date '+%Y-%m-%d %H:%M') cron task ran" >> reports/cron_output.txt
    log "cron task ran"
}
KIT_FUNCS

cat > main.sh <<'KIT_MAIN'
#!/bin/bash
# main.sh – L11 Watchlist Manager
# Menu-driven shell script (while loop + case)
cd "$(dirname "$0")" || exit 1
source lib/functions.sh

case "$1" in
    --help)   show_help; exit 0 ;;
    --backup) do_backup; exit 0 ;;
    --cron)   cron_task; exit 0 ;;
esac

while true; do
    echo
    echo '========== WATCHLIST MANAGER =========='
    echo '1) Add a title'
    echo '2) Mark as watched and give a rating (sed)'
    echo '3) Recommend unwatched titles by genre'
    echo '4) Average rating per genre'
    echo '5) Backup the watchlist with date stamp'
    echo "6) View data"
    echo "7) Backup data (tar.gz)"
    echo "8) View activity log"
    echo "0) Exit"
    read -p "Choose an option: " ch
    case "$ch" in
        1) feature_1 ;;
        2) feature_2 ;;
        3) feature_3 ;;
        4) feature_4 ;;
        5) feature_5 ;;
        6) view_data ;;
        7) do_backup ;;
        8) view_log ;;
        0) echo "Bye!"; break ;;
        *) echo "Invalid choice, try again." ;;
    esac
done
KIT_MAIN

cat > README.md <<'KIT_README'
# L11 – Watchlist Manager

**Student:** ZARMIN SHAIKH | **Roll:** F07 | **Division:** G | **Enrollment:** 24004501210415

## Problem
Create a watchlist manager for movies and series with status, ratings and genre recommendations.

## Who will use it
Binge-watchers who keep forgetting what to watch next.

## Folder structure
- main.sh – menu (run with ./main.sh)
- lib/functions.sh – all functions
- data/ – data files
- reports/ – reports created by the script
- backups/ – tar.gz backups
- logs/ – activity.log and cron.log

## Features
1. Add a title
2. Mark as watched and give a rating (sed)
3. Recommend unwatched titles by genre
4. Average rating per genre
5. Backup the watchlist with date stamp

## How to run
    cd ~/linux_project/watchlist
    ./main.sh
    ./main.sh --help

## Crontab task
Every Saturday at 7 PM, write 3 random unwatched recommendations to weekend_picks.txt

    0 19 * * 6 /bin/bash $HOME/linux_project/watchlist/main.sh --cron >> $HOME/linux_project/watchlist/logs/cron.log 2>&1

## Commands used
sed, awk, grep, sort, tar

## What I learned
(write 3-5 lines here)
KIT_README

chmod +x main.sh lib/functions.sh
touch logs/activity.log
echo
echo "Starter kit ready!  Folder: $P"
ls -R "$P"
echo
echo "Next:  cd ~/linux_project/watchlist  &&  ./main.sh"
