#!/bin/sh
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1\n\nbody\n\n" > inbox
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2\n\nbody\n\n" >> inbox
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1\n\nbody\n\n" > inbox2
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2\n\nbody\n\n" >> inbox2
cat inbox2 > /dev/null
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 1\n\nbody\n\n" > inbox3
printf "From sender@localhost  Fri Nov 20 11:12:39 2020\nSubject: test message 2\n\nbody\n\n" >> inbox3
neomutt=${1:-neomutt}
$neomutt -v | head -n 1
$neomutt -F muttrc -e 'push <quit>' -Z
