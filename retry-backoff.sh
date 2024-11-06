MAX_RETRY=20
COUNT=0
SLEEP=1
SEVERITY="null"

while [ "$SEVERITY" = NULL ]; do
  SEVERITY=$(curl)
  
  sleep $SLEEP
  SLEEP=$(($SLEEP*2))
  COUNT=$((COUNT+1))

  if [ $COUNT -ge $MAX_RETRY ]; then
    exit 1
done

if [ $SEVERITY == "Critical" ]; then
  exit 1
else
  echo "All good"
fi