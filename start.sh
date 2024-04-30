#!/bin/sh

nginx &

rm ./*

while true; do
	echo "$(date)"
	if git clone -b "$BRANCH" "$REPOSITORY" .; then
		break
	else
		echo "Failed to clone the repository. Retrying in $INTERVAL seconds."
		sleep "$INTERVAL"
	fi
done

while true; do
	echo "$(date)"
	git pull
	sleep "$INTERVAL"
done
