#!/bin/bash

follow_redirects() {
  url="$1"
  max_redirects="$2"
  current_redirects=0

  while [ "$current_redirects" -lt "$max_redirects" ]; do

    final_url=$(curl -sIL -o /dev/null -w "%{url_effective}\n" "$url")

    echo "Redirect $((current_redirects + 1)): $url -> $final_url"

    if [ "$url" == "$final_url" ]; then
      break
    fi

    url="$final_url"
    current_redirects=$((current_redirects + 1))
  done

  echo "Final Destination URL: $final_url"
}

if [ $# -lt 1 ]; then
  echo "Usage: $0 <URL> [max_redirects]"
  exit 1
fi

url="$1"
max_redirects="${2:-10}"

follow_redirects "$url" "$max_redirects"

