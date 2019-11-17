ITER=0
BACKGROUND=$2
exec $1 | while read line
do
  if [ $ITER -lt 2 ];
  then
    echo "<span background='${BACKGROUND}'>$line</span>"
  else
    echo "$line"
  fi
  ITER=$(expr $ITER + 1)
done
