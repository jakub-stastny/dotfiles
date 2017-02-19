#!/usr/local/bin/zsh

log-time --bitbar || echo '[✔︎] | color=green'

echo '---'
echo 'Today | color=green'
echo '---'
pomodoro today

echo '---'
echo 'Active projects | color=green'
echo '---'
pomodoro show-projects
