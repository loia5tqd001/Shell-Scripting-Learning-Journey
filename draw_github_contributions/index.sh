weeks_offset=${1:-0}
commits_per_day=${2:-50}

./draw_github_contributions.sh nguyen.txt $weeks_offset $commits_per_day
./draw_github_contributions.sh huynh.txt  $weeks_offset $commits_per_day
./draw_github_contributions.sh loi.txt    $weeks_offset $commits_per_day