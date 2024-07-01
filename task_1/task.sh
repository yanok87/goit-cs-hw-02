#!/bin/bash

# 
urls=(
    "https://google.com" 
    "https://facebook.com"
    "https://twitter.com"
    "https://testurl.testcom"
)

urlfile="website_status.log"

> "$urlfile"

check_site(){
    if curl -sL --head "$1" | grep "200" > /dev/null; then
      echo "$1 is UP"
      echo "$1 is UP" >> "$urlfile"
      echo "$1 is UP" | tee -a "$urlfile"
    else
      echo echo "$1 is DOWN"
      echo "$1 is DOWN" >> "$urlfile" 
    fi
}

for site in "${urls[@]}"; do
  check_site "$site"
done  

echo "results have been logged to $urlfile"