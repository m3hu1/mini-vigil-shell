#!/bin/bash

check() {
  url="$1"
  final_url=$(curl -sIL -w "%{url_effective}" -o /dev/null "$url")

  if [ $? -eq 0 ]; then
    echo "Entered URL : $url"
    echo "Final Destination : $final_url"
  else
    echo "Failed to retrieve URL: $url"
  fi
}

check "$1"