# dotfiles
ロボ向けの設定ファイル

注）`vim`コマンドで起動するエディタはNeovim
## インストール
インストールされるNeovimのAppImageがx86-64用なので，その他のアーキテクチャでは代わりに簡易的なVimの設定が行われます<br>
ただし，Neovimとは異なり，自動で補完候補が表示されないので，補完候補を表示したい場合は`Ctrl-n`を押して下さい
```
git clone https://github.com/amslabtech/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```
以下がインストールされます
- Neovim
- Vim (vim-gtk)
- tmux
- xsel
- python3
- python3-pip
- fuse
- libfuse2
- font (Hack Nerd Font Regular)

以下がセットアップされます

- Neovim
- Vim
- tmux

## トラブルシューティング
#### インストールが途中で止まる
- WSLの場合，pip installに時間がかかっている可能性が高いです．しばらく待つとインストールが進みます．
- 操作を促すような表示がある場合，指示に従って下さい．（Enterの入力など）
#### Neovimを起動すると画面が黒いまま動かない
`Ctrl-c`を押した後，エディタを再起動して下さい

#### Neovimのプラグインのインストールが開始されない
エディタを再起動して下さい

#### `vim`コマンドでNeovimではなく，Vimを起動したい
以下を実行して下さい
```
sudo update-alternatives --auto vim
```

#### Vimのクリップボード連携が上手く行かない（アーキテクチャがx86_64以外）
以下を実行し，`vim-gtk`を選択して下さい
```
sudo update-alternatives --config vim
```

#### 設定がおかしくなった
再インストールすると，設定の上書きおよびキャッシュの削除が行われます

#### 文字の色が白い
True Colorに対応していない可能性があります<br>
ssh接続している場合，自身の環境のシェルの設定（`.bashrc`など）やtmux (`~/.tmux.conf`) のcolor設定を解除して下さい<br>
それでも改善されない場合，シェルの設定に以下を追記して下さい
```
export TERM=screen-256color
```
※ 設定を変更した場合はターミナルまたはtmuxを再起動して下さい

#### 文字の表示がおかしい
- 端末のフォントが不適切な可能性があります
  - `Hack Nerd Font Regular`に変更して下さい
- True Colorに対応していない可能性があります<br>
  - tmux内でNeovimを起動すると正常に表示されやすいです
