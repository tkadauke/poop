set -e

if [ "$POOP_PATH" == "" ]; then
  echo "POOP_PATH is not set. Poop will not work"
else
  for I in $POOP_PATH/bootstrap/*.sh; do
    source $I
  done
fi
