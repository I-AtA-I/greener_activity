#!/bin/bash

#Script to set up a git repository to track streaks and automate commits every 6 hours

#creating a 'streak' repository
cd ~
mkdir streak
cd streak
touch README.md

#initializing git repository
git init
echo "xxx" > README.md
git add README.md
git commit -m "xxx"
gh repo create streak --public --source=. --remote=origin --push


#creating necessary files and setting up cron job
cd ~
mkdir Streakerkeeper
cd Streakerkeeper
touch crontab.sh
chmod +x crontab.sh

echo '(crontab -l 2>/dev/null; echo "0 */6 * * * ~/Streakerkeeper/uploader.sh") | crontab -' >> crontab.sh


#creating uploader.sh file
touch uploader.sh
chmod +x uploader.sh


randon=$(($RANDOM + $RANDOM * $RANDOM))

echo "$randon" >> ~/streak/README.md

cd ~/streak

echo "Input your username you are currently logged in as: "
read user

echo "git add README.md" > "/home/$user/Streakerkeeper/uploader.sh"
echo "git commit -m $randon" >> "/home/$user/Streakerkeeper/uploader.sh"
echo 'git push README.md' >> "/home/$user/Streakerkeeper/uploader.sh"


cd ~/Streakerkeeper
./crontab.sh
