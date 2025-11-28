echo "[$(date '+%d:%m:%Y %H:%M')] [INFO] System rebooted. Starting reboot actions..." >> /tmp/cron_log.txt
echo "[$(date '+%d:%m:%Y %H:%M')] [INFO] Sleeping 10 seconds and restarting traefik.." >> /tmp/cron_log.txt
sleep 10 && docker restart laia_pro-traefik-1
echo "[$(date '+%d:%m:%Y %H:%M')] [INFO] Traefik restarted." >> /tmp/cron_log.txt
echo "[$(date '+%d:%m:%Y %H:%M')] [INFO] All actions performed." >> /tmp/cron_log.txt
