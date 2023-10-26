# dotfiles
ロボ向けの設定ファイル
## インストール
```
git clone https://github.com/amslabtech/dotfiles.git ~/dotfiles
./dotfiles/install.sh
```
以下がインストール（再インストール）される

ただし，vimで起動するeditorはneovim

- vim
- neovim
- tmux
- xsel
- python3
- pip3

以下がコピーされる

- font (MesloLGS NF Regular)

以下がセットアップされる

- vim
- neovim
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
