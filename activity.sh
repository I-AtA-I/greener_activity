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

echo "Input your username you are currently logged in as: "
read user
( crontab -l 0>/dev/null; echo "0 */6 * * * /home/$user/Streakerkeeper/uploader.sh" ) | crontab -


#creating uploader.sh file
touch uploader.sh
chmod +x uploader.sh


randon=$(($RANDOM + $RANDOM * $RANDOM))

echo "$randon" >> ~/streak/README.md

cd ~/streak


echo "$randon" > "/home/$user/streak/README.md"


echo 'randon=$(($RANDOM + $RANDOM * $RANDOM))' > "/home/$user/Streakerkeeper/uploader.sh"
cd "/home/$user/Streakerkeeper"
echo "cd /home/$user/streak" >> "/home/$user/Streakerkeeper/uploader.sh"
echo 'echo $randon >> README.md' >> "uploader.sh"

echo "git add README.md" >> "/home/$user/Streakerkeeper/uploader.sh"
echo "git commit -m $randon" >> "/home/$user/Streakerkeeper/uploader.sh"
echo 'git push' >> "/home/$user/Streakerkeeper/uploader.sh"


cd ~/Streakerkeeper
./uploader
