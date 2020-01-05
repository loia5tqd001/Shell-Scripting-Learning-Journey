#!/bin/bash

# wish design:
#./draw_github_contributions.sh ./dates.txt


do_dummy_thing() {
  declare -r FILENAME="dummy.txt"

  if [ -e "$FILENAME" ]; then
    rm $FILENAME
  else
    touch "$FILENAME"
    echo "dummy text" > "$FILENAME"
  fi
}

create_commits() {
  local date_to_commit=$1
  local number_of_commits=$2
    
  for ((i=0; i < number_of_commits; i++)); do

    do_dummy_thing
    git add .
    git commit -m "dummy commit"

    GIT_COMMITTER_DATE="$date_to_commit" git commit --amend --no-edit --date "$date_to_commit"
    echo "committed $(( i + 1 )) commits for $date_to_commit"

  done
}


file_data=$1

if [ -f "$file_data" ]; then
  #readarray is only available from bash 4.0
  readarray -t array_dates < $file_data

  if (( ${#array_dates[@]} )); then

    for date in ${array_dates[*]}; do

      if date -d "$date"; then
        create_commits "$date" 20
      else
        echo "invalid date: $date"
      fi

    done

  else
    echo "$file_data is empty"

  fi

else
  echo "File data not exist: $file_data"

fi