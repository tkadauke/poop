set -e

if [ "$FOOP_PATH" == "" ]; then
  echo "FOOP_PATH is not set. Foop will not work"
else
  for I in $FOOP_PATH/bootstrap/*.sh; do
    source $I
  done
fi
