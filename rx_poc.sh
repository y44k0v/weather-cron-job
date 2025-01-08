#!/bin/bash
# location
city_name="thornhill"
# weather data
curl -s wttr.in/$city_name?T --output weather_report  
#To extract Current Temperature
ob_temp=$(curl -s wttr.in/$city_name?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city_name: $ob_temp"
# To extract the forecast tempearature for noon tomorrow
fc_temp=$(curl -s wttr.in/$city_name?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city_name : $fc_temp C"

# Assign Country and City to variable TZ
TZ='Canada/Thornhill'

# current day, month
hour=$(TZ='Canada/Thornhill' date -u +%H) 
day=$(TZ='Canada/Thornhill' date -u +%d) 
month=$(TZ='Canada/Thornhill' date +%m)
year=$(TZ='Canada/Thornhill' date +%Y)

record=$(echo -e "$year\t$month\t$day\t$ob_temp\t$fc_temp C")
echo $record>>rx_poc.log