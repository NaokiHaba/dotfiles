#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
    echo "Not macOS!"
    exit 1
fi

# Homebrewのパスが通っているか確認
if [[ $(uname -m) == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Homebrewパッケージをインストールしています..."
brew update
brew bundle --file=~/.bin/.Brewfile || {
    echo "Brewfileのインストールに失敗しました"
    exit 1
}
brew cleanup