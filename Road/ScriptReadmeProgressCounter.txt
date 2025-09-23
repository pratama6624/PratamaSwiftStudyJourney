done=$(grep -oE '\[(x|X|√|✔)\]' README.md | wc -l)
todo=$(grep -o '\[ \]' README.md | wc -l)
total=$((done + todo))
if [ "$total" -eq 0 ]; then 
  echo "No checklist found"; 
else 
  percent=$(( (done*100)/total ))
  echo "Progress: $percent% ($done/$total)"
fi