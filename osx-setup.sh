#install brew
#install node
# !!! check for new emails every hour

#save screenshots to Downloads, becouse it's easier to drag n' drop
defaults write com.apple.screencapture location ~/Downloads

#ssh timeout keep alive
mkdir ~/.ssh
nano ~/.ssh/config
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 5
  UseKeychain yes

https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically

#links
http://charles.lescampeurs.org/2012/06/18/right-click-open-with-sublime-text-2
https://michaelkummer.com/technology/create-dropbox-link-file-finder-using-automator/
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
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
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
sudo sh -c "echo '127.0.0.1 www.bankier.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.mamstartup.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 mamstartup.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.lifehacker.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.mashable.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 lifehacker.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 mashable.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.youtube.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.spidersweb.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.netflix.com' >> /etc/hosts"

dscacheutil -flushcache
