#!/usr/local/bin/zsh

log-time --bitbar || echo "| image=iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAACx1BMVEUAAAAhZ5QmerEmgLkmgLomgLomgLomgLomgLomgLkme7EhZ5QAAAAeYYwlerIcWogZTHkaTn0aTn0aTn0aTn0aTn0aTXocW4klerIfYYwicaUaZJtRXGurrLCur7NWYW4aZZoicaUhcacUWpN7hZWCi5gWXJQhcKcebqUTWZN9h5eDjJsUW5UebqUca6QRV5N8h5eDjJoSWZQca6QaaKMPVZJ8h5eDjJoQV5QaaKMXZqINU5F8h5eDjJoPVZMXZqIVY6AMUZB8h5eDjJoNU5IVY6ETX58LTo98h5eDjJoMUJATX58SXJwKTI18h5eDjJoLTo8SXJwRWJoJSYx9h5eDjJoKS40RWJsQVJcKSYx/iJeBipcKSY0QVJcORHwNU50yUnlVaYZTaIVTaIVTaIVTaIVTaIVUaIUwUXcNU50ORH0GGzENRH8LUZ0JUKAJUaEJUaEJUaEJUaEJUaEJUKALUZ4NRH8GHDIAAAADDBcIJUYILFQILFQILFQILFQILFQILFQILFQIJUYDDRgAAACxs7ewsrewsrewsrexs7f29fT19PT09PT09PT09PT09PT29fX39vb39vX19PPy8vLy8vLy8vLy8vL09PTf39/Jycny8fD19PPy8vLz8/Py8vLy8vLy8vK1tbVeXl6wsLD19fT19PPq6ura2trz8/Py8vKlpaVISEisrKzy8vL19fT29vXS0tJeXl60tLS0tLRFRUWlpaX09PTy8vL19PT19PPx8fGfn59JSUlISEiGhobv7+/z8/Py8vL19PT19PPz8/Pu7u6Pj49lZWXd3d309PTy8vLy8vL19PT19PPy8vLz8/Pl5eXMzMzy8vLy8vLy8vLy8vL19PT19PPy8vLy8vLz8/P09PTy8vLy8vLy8vLy8vL19fTz8e/v7u3v7u3v7u3v7u3v7u3v7u3v7u3v7u3y8e////+EY5Z8AAAAhXRSTlMDW8nf3t7e3t7fylwESeT////////////lS5b///////+YpP////+kpP////+kpP////+kpP////+kpP////+kpP////+kpP////+kpP////+kpP////+ko/////+jhf7////////////+hi3A+/7+/v7+/v77wi8AMomjpKSkpKSjiTMB0B5+TQAAAAFiS0dE7CG5sxsAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAHdElNRQfhAhQRBSmWVlRBAAABG0lEQVQY0wEQAe/+AAABAgMEBQYGBgYHCAkKCwwADQ4PEBESExMTExQVFhcYGQAaGxwdhYaHh4eHiIkeHyAhACIjJIqLjI2Njo+QkZIlJicAKCkqk5SVlZaXmJmamyssLQAuLzCcnZ6foKGio6SlMTIzADQ1NqanqKmqq6ytrq83ODkAOjs8sLGys7S1tre4uT0+PwBAQUK6u7y9vr/AwcLDQ0RFAEZHSMTFxsfIycrLzM1JSksATE1Ozs/Q0dLT1NXW109QUQBSU1TY2drb3N3e3+DhVVZXAFhZWuLj5OXm5+jp6utbXF0AXl9gYWJjZGRkZGVmZ2hpagBrbG1ub3BxcXFxcnN0dXZ3AHh5ent8fX5+fn5/gIGCg4Sov3NOEAy3KQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxNy0wMi0yMFQxNzowNTo0MS0wNTowMHrHzbIAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTctMDItMjBUMTc6MDU6NDEtMDU6MDALmnUOAAAAAElFTkSuQmCC"

echo '---'
echo 'Today | color=green bash=pomodoro param1=edit' #  terminal=false
echo '---'
pomodoro today

echo '---'
echo 'Active projects | color=green'
pomodoro show-projects | sed 's/^/--/'
echo '---'

for task_list in ~/tasks.todo ~/.bitbar/tasks.todo ~/Dropbox/Projects/*/*/tasks.todo; do
  echo "$(basename "$(dirname $task_list)") | bash=atom param1='${task_list}'" # TODO: terminal=false
  cat $task_list | sed 's/^/--/'
done
