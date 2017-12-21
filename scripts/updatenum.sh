#!/bin/bash
aurUpdates=$(cower -u|wc -l)
pacUpdates=$(checkupdates|wc -l)
echo "$aurUpdates|$pacUpdates"
