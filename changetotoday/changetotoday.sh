#!/bin/bash

# wish design:
#./changetotoday.sh 5


declare -r integer_pattern="^[0-9]+$"

if [[ $1 =~ $integer_pattern ]]; then
  count=$1

  # change git history (commit date) of n commits with shell script
  # https://stackoverflow.com/q/59523376/12552764
  GIT_SEQUENCE_EDITOR="sed -i -re 's/^pick /e /'" git rebase -i "HEAD~$count"

  for ((i=0; i<count; i++)); do
    GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"
    git rebase --continue
    echo "done for $(( i + 1 )) commits"
  done

  echo "done all"

else
  echo "invalid argument [number of commits] $1"
  
fi

