#!/bin/bash

GITCONFIG_LOCAL="$HOME/.gitconfig.local"

# .gitconfig.localが存在しない場合のみ作成
if [ ! -f "$GITCONFIG_LOCAL" ]; then
    echo "Gitの個人設定を行います..."
    
    # ユーザー名とメールアドレスの入力を求める
    read -p "Git user name: " git_name
    read -p "Git email address: " git_email
    
    # .gitconfig.localの作成
    cat > "$GITCONFIG_LOCAL" << EOF
[user]
    name = ${git_name}
    email = ${git_email}
EOF
    
    echo ".gitconfig.localを作成しました"
else
    echo ".gitconfig.localは既に存在します"
fi