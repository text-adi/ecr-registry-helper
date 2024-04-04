#!/usr/bin/env sh

if [ -n "${DEBUG}" ]; then
  echo "Debug is enable!!!"
fi

echo "Starting..."

for file in /entrypoint.d/*; do
  if [ -f "$file" ]; then
    if [ -n "${DEBUG}" ]; then
      echo "** Execute - $file **"
    fi

    # shellcheck disable=SC1090
    . "$file"
  fi
done
