# Copy the config back after mounting volumn
mv -vn /opt/cups/etc-cups/* /etc/cups 

/usr/sbin/cupsd -f &
CUPSD_PID=$!

if [ $(grep -ci $CUPS_USER_ADMIN /etc/shadow) -eq 0 ]; then
    adduser -D $CUPS_USER_ADMIN -G lpadmin
    command="${CUPS_USER_PASSWORD%\"}"
    command="${command#\"}"
    command="$CUPS_USER_ADMIN:$command" 
    echo $command | chpasswd
fi

if [ ! -f /etc/cups/network_ok.txt ]; then
  max_retry=5
  counter=0
  command="cupsctl --remote-admin --remote-any --share-printers"
  until $command
  do
     sleep 10
     [[ counter -eq $max_retry ]] && echo "Failed to set network" && exit 1
     echo "Trying again. Try #$counter"
     ((counter++))
  done
  echo "Network rule is set ($counter)"
  touch /etc/cups/network_ok.txt
fi

echo "Start waiting PID $CUPSD_PID"
wait $CUPSD_PID
