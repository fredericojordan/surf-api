#!/bin/bash
kill $(ps | grep phantomjs | awk '{print $1}')  # killall phantomjs
phantomjs --wd --webdriver-loglevel=ERROR &
mix run lib/scraper/scraper.exs