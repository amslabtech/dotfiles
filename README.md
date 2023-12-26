# dotfiles
ロボ向けの設定ファイル

注）`vim`コマンドで起動するエディタはneovim
## インストール
```
git clone https://github.com/amslabtech/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```
以下がインストール（再インストール）される
- Neovim
- tmux
- xsel
- python3
- pip3
- libfuse2 (ubuntu22.04のみ)

以下がコピーされる

- font (MesloLGS NF Regular)

以下がセットアップされる

- Neovim
- tmux

## トラブルシューティング
#### 設定がおかしくなった場合
再インストールすれば，設定の上書きおよびキャッシュの削除が行われる

#### 文字の色が白い場合
ssh接続している場合，自身の環境のtmux (`~/.tmux.conf`) のcolor設定が以下のようになっていることを確認する

(設定を変えた場合，tmuxを開き直す必要がある)
```
set -g default-terminal "xterm-256color"
set -g terminal-overrides "xterm:colors=256"
```
