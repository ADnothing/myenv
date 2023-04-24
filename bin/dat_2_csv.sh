#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo -e "ERROR : Need at least one filename as an argument."
    exit 1
fi

for file in "$@"; do

  echo "Processing $file..."

  if [ ! -f "$file" ]; then
    echo "$file doesn't exist"
    exit 2
  fi
  
  is_gzipped=$(file -b "$file" | grep -q gzip && echo 1 || echo 0)
  
  if [ $is_gzipped -eq 1 ]; then
    echo "Decompressing $file..."
    gzip -d "$file"
    
    basefile=$(basename $file .gz)
    
    if [ ! -f "$basefile" ]; then
      echo "ERROR : failed to decompress $file"
      exit 3
    fi
    
    if [[ "$basefile" != *.dat ]]; then
      echo "ERROR: $basefile is not a .dat file"
      exit 4
    fi
    
  fi
  
  new_file="$(basename "$basefile" .dat).csv"
  echo "Converting $basefile to $new_file..."
  sed 's/ \+/ , /g' $basefile > "$new_file"
  
  echo "Compressing $basefile..."
  gzip $basefile
  echo "compressing $new_file..."
  gzip "$new_file"
  
  
  if [[ ! -f "$file" || ! -f "$new_file.gz" ]]; then
    echo "ERROR : failed to compress $basefile or $new_file"
    exit 5
  fi


  echo "Finished processing $file."
done

echo "All files have been processed successfully."

exit 0
