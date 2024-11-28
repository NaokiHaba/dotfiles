#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# バックアップディレクトリの作成
mkdir -p "$BACKUP_DIR"

for dotfile in "${SCRIPT_DIR}"/.??* ; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

    # 既存のファイルをバックアップ
    target="$HOME/$(basename "$dotfile")"
    if [ -e "$target" ]; then
        echo "Backing up $target to $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    fi

    ln -fnsv "$dotfile" "$HOME"
done

echo "ドットファイルのリンクが完了しました。"