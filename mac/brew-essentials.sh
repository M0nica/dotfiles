
# Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Installs Casks
brew tap homebrew/cask

## Apps I use
brew install 4k-video-downloader
brew install 1password
brew install google-chrome #Chrome
brew install firefox
brew install homebrew/cask-versions/firefox-nightly # Nightly
brew install homebrew/cask-versions/google-chrome-canary # Chrome Canary
brew install adobe-acrobrat-pro
brew install adobe-creative-cloud
brew install astropad
brew install backblaze
brew install deckset
brew install docker
brew install github # GitHub Desktop
brew install grammarly
brew install hyper
brew install kap
brew install insomnia
brew install imageoptim
brew install intellij-idea-ce
brew install krisp
brew install macdown
brew install microsoft-edge
brew install microsoft-office
brew install microsoft-outlook
brew install microsoft-powerpoint
brew install microsoft-word
brew install muzzle
brew install notion
brew install postman
brew install protonvpn
brew install rescuetime
brew install sketch
brew install slack
brew install spotify
brew install screenflow
brew install streamlabs-obs
brew install send-to-kindle
brew install whatsapp
brew install youtube-to-mp3
brew install visual-studio-code
brew install zeplin
brew install zoom

# Restore plists of apps
mackup restore

# Remove outdated versions from the cellar.
brew cleanup
