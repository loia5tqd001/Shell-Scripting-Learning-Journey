# Delete %README%.pdf files

- To delete all the annoying pdf files from [this folder](https://github.com/loia5tqd001/Web-Learning-Journey/tree/master/frontend/30_days_css3)


To print the file names before delete:
```
find <source_dir> -name <filename> -print

find . -name "*README*.pdf" -print
```

To delete:
```
find <source_dir> -name <filename> -delete

find . -name "*README*.pdf" -delete
```

https://unix.stackexchange.com/questions/3672/how-do-i-delete-all-files-with-a-given-name-in-all-subdirectories

To rename file *(with bash shell)*:
```
for file in pre_remove*mid_remove*post_remove; do 
  newfile=pre_add${file#pre_remove}
  newfile=${newfile%post_remove}post_add
  newfile=${newfile/mid_remove/mid_add}
  mv "$file" "newfile"
done
```
