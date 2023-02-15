#!/bin/bash

for f in $SUBST_FILES; do
  if [[ -f $f ]]; then
    tmpfile=$(mktemp)
    cp $f $tmpfile
    cat $tmpfile | envsubst > $f
    echo "applied envsubst to $f"
    if [[ $DEBUG == "yes" ]]; then
      cat $f
    fi
  else
    echo "$f not found"
  fi
done
