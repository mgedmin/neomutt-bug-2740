#!/bin/sh
cd "$(dirname "$0")" || exit 255
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1 in inbox\n\nbody\n\n" > inbox
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2 in inbox\n\nbody\n\n" >> inbox
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1 in inbox 2\n\nbody\n\n" > inbox2
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2 in inbox 2\n\nbody\n\n" >> inbox2
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1 in inbox 3\n\nbody\n\n" > inbox3
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2 in inbox 3\n\nbody\n\n" >> inbox3
# mark inbox 2 as read
cat inbox2 > /dev/null  # or I could use touch -a, I suppose
neomutt=${1:-neomutt}
$neomutt -v | head -n 1
$neomutt -F muttrc -y
