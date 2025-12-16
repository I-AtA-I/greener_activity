#!/bin/bash

echo "Input your username you are currently logged in as: "
read user


# set up streak repo
cd ~
mkdir -p streak
cd streak
git init
gh repo create streak --public --source=. --remote=origin --push
echo "Input the 'streak' URL from your profile: "
read URL
git remote add origin $URL
git pull origin main --rebase || true



echo "xxx" > README.md
git add README.md
git commit -m "initial commit"
git push -u origin main

# set up Streakerkeeper folder
cd ~
mkdir -p Streakerkeeper
cd Streakerkeeper

# cron job every 6 hours
( crontab -l 2>/dev/null; echo "0 */2 * * * /home/$user/Streakerkeeper/uploader.sh" ) | crontab -

# create uploader.sh
cat > uploader.sh << 'EOF'
#!/bin/bash
randon=$(($RANDOM + $RANDOM * $RANDOM))
cd ~/streak
echo $randon > README.md
git add README.md
git commit -m "$randon"
git push
EOF

chmod +x uploader.sh

# run once immediately
bash uploader.sh
