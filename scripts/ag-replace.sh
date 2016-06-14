#/bin/bash

excaped1=$(echo "$1" | sed -e 's/[\/&]/\\&/g');
excaped2=$(echo "$2" | sed -e 's/[\/&]/\\&/g');
ag $1 -l | while read line; do
sed -i "s/$excaped1/$excaped2/g" $(pwd)/$line;
done;
