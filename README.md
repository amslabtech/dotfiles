# dotfiles
ロボ向けの設定ファイル

注）`vim`コマンドで起動するエディタはNeovim
## インストール
```
git clone https://github.com/amslabtech/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```
以下がインストール（再インストール）されます
- Neovim
- tmux
- xsel
- python3
- python3-pip
- libfuse2 (ubuntu22.04のみ)
- font (Hack Nerd Font Regular)

以下がセットアップされます

- Neovim
- tmux

## トラブルシューティング
#### Neovimを起動すると画面が黒いまま動かない
`Ctrl-c`を押した後，エディタを再起動して下さい

#### Neovimのプラグインのインストールが開始されない
エディタを再起動して下さい

#### 設定がおかしくなった
再インストールすると，設定の上書きおよびキャッシュの削除が行われます

#### 文字の色が白い
True Colorに対応していない可能性があります<br>
ssh接続している場合，自身の環境のtmux (`~/.tmux.conf`) のcolor設定を以下のようにして下さい

(設定を変えた場合，tmuxを開き直す必要がある)
```
set -g default-terminal "xterm-256color"
set -g terminal-overrides "xterm:colors=256"
```

shellでcolor設定している場合は解除して下さい

#### 文字の表示がおかしい
- 端末のフォントが不適切な可能性があります
  - `Hack Nerd Font Regular`に変更して下さい
- True Colorに対応していない可能性があります<br>
  - tmux内でNeovimを起動すると正常に表示されやすいです
