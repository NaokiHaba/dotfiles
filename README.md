## 引き継ぎ前のマシンでやること

```bash
# バンドルをダンプする
$ brew bundle dump --global
```

## 引き継ぎ先のマシンでやること

```bash
$ xcode-select --install
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# バンドルをインストール
$ brew bundle --global
```
