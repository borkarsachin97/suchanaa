#!/bin/bash

# Define cache and URL variables for both feeds
CACHE_FILE_1="$HOME/.cache/rss_feed_hindu.xml"
CACHE_FILE_2="$HOME/.cache/rss_feed_express.xml"
TEMP_FILE_1="$HOME/.cache/tmphn.xml"
TEMP_FILE_2="$HOME/.cache/tmpiex.xml"
LAST_UPDATE_FILE="$HOME/.cache/rss_last_update.txt"
URL_1="https://www.thehindu.com/news/national/?service=rss"
URL_2="https://indianexpress.com/feed/"

# Fetch RSS feed and update cache for the first URL
if curl -s "$URL_1" > "$TEMP_FILE_1" && curl -s "$URL_2" > "$TEMP_FILE_2"; then
    mv "$TEMP_FILE_1" "$CACHE_FILE_1"
    mv "$TEMP_FILE_2" "$CACHE_FILE_2"
    echo "$(date +"%H:%M - %d, %B")" > "$LAST_UPDATE_FILE"
else
    echo "No Internet Connection"
fi

