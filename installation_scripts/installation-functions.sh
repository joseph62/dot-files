#! /usr/bin/env bash

create-directory-if-not-exists () {
  if [ -d $1 ]; then
    echo "$1 already exists. Skipping..."
  else
	echo "Creating $1"
    mkdir $1
  fi;
}

update-file () {
  if [ -f $2 ]; then
    if diff $2 $1 > /dev/null; then
      echo "$3 is the same. Skipping..."
    else
	  echo "$3 already exists. Backing up and copying..."	
      mv $2 "$2.bak"
      cp $1 $2
    fi
  else
	echo "Copying $3"
    cp $1 $2
  fi;
}
