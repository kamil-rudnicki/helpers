#install brew
#install node
#install composer for php

#save screenshots to Downloads, becouse it's easier to drag n' drop
defaults write com.apple.screencapture location ~/Downloads

#ssh timeout keep alive
nano ~/.ssh/config
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 5

#links
http://charles.lescampeurs.org/2012/06/18/right-click-open-with-sublime-text-2
https://www.blockloop.io/mastering-bash-and-terminal

#initial config
xcode-select --install
sudo chmod -R 777 /Library/WebServer/Documents
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true
defaults write com.apple.TextEdit RichText -int 0
xcode-select --install
xcrun simctl delete unavailable
sudo pmset -a sms 0
defaults write com.apple.dock no-bouncing -bool false && \
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
chflags nohidden ~/Library
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
killall Dock
  
#some apps & extansions for mac
brew install caskroom/cask/brew-cask
brew cask install qlcolorcode qlstephen quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook

#block websites
sudo sh -c "echo '127.0.0.1 wykop.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.wykop.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 reddit.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.reddit.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 techcrunch.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 antyweb.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 news.ycombinator.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 di.com.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 facebook.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.facebook.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 linkedin.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.linkedin.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 twitter.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.twitter.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.macrumors.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.dobreprogramy.pl' >> /etc/hosts"

sudo sh -c "echo '127.0.0.1 www.money.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.bankier.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.mamstartup.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 mamstartup.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.lifehacker.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.mashable.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 lifehacker.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 mashable.com' >> /etc/hosts"

dscacheutil -flushcache

#Git http://haacked.com/archive/2014/07/28/github-flow-aliases/
nano ~/.gitconfig 
[alias]
    co = checkout
    ec = config --global -e
    up = !git pull --rebase --prune $@ && git submodule update --init --recursive
    cob = checkout -b
    cm = !git add -A && git commit -m
    pall = "!func(){ git add . && git commit -aqm $1 && git pull -q --no-progress && git push -q; }; func"
    save = !git add -A && git commit -m 'SAVEPOINT'
    wip = !git add -u && git commit -m "WIP" 
    undo = reset HEAD~1 --mixed
    amend = commit -a --amend
    wipe = !git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard
    bclean = "!f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d; }; f"
    bdone = "!f() { git checkout ${1-master} && git up && git bclean ${1-master}; }; f"
