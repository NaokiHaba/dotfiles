#!/bin/bash

# macOSかどうかチェック
if [ "$(uname)" != "Darwin" ] ; then
    echo "Not macOS!"
    exit 1
fi

# Xcodeコマンドラインツールのインストール
if ! xcode-select -p &> /dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
fi

# Homebrewのインストール
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # M1 Macの場合のPATH設定
    if [[ $(uname -m) == 'arm64' ]]; then
        echo "Configuring Homebrew for Apple Silicon..."
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Oh-my-zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Initial setup completed!"

