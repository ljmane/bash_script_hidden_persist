# bash_script_hidden_persist

Access device and upload script

Script deletes itself upon execution. Script traps EXIT, SIGTERM, and SIGKILL.
Upon trap trigger the backup_script function executes.
Function does the following:
Pulls deleted script from the proc filesystem and writes it to disk.
Creates a new script that executes the deleted script, deletes itself, and creates an @reboot cronjob that executes itself.
Makes both scripts executable and removes the cronjob entry.


