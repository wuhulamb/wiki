#!/usr/bin/env bash

echo -e "git status -s\n"
git status -s

echo -e "\n\033[1;31mAdd & Commit(Enter anything) or Not(Ctrl + C)\033[0m"
read

git add .
git commit

ss-start
sleep 1
export ALL_PROXY=socks5://127.0.0.1:1080
echo -e "GitHub comes first.\n"
git push git@github.com:wuhulamb/wiki-code.git main
unset ALL_PROXY
ss-shutdown

echo -e "\nThen there comes Cloud Server.\n"
bundle exec jekyll build
echo -e "Enter anything to push to wuhulamb.me\n"
read
rsync -a --delete _site/ hellofree@wuhulamb.me:~/websites/wiki.wuhulamb.me/

echo -e "push to git@github.com:wuhulamb/week000.git\n"
echo 'baseurl: "/wiki"' >> _config.yml
bundle exec jekyll build
git restore _config.yml
rsync -a --delete --exclude='.*' --exclude='README.md' _site/ /home/xu/projects/wiki/
cd /home/xu/projects/wiki/
git add .
git commit -m "auto commit"

ss-start
sleep 1
export ALL_PROXY=socks5://127.0.0.1:1080
git push git@github.com:wuhulamb/wiki.git main
unset ALL_PROXY
ss-shutdown
echo -e "\nDone ...\n"
