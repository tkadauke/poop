for I in test/*.sh; do
  /bin/echo -n "$I: "
  bash -e $I
done
