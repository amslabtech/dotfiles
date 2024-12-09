# dotfiles
ロボ向けの設定ファイル

注）`vim`コマンドで起動するエディタはNeovim
## インストール
```
git clone https://github.com/amslabtech/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```
注）Vimでは，自動で補完候補が表示されないので，補完候補を表示したい場合は`Ctrl-n`を押して下さい（Neovimではcoc.nvimが有効になっているため，補完候補が表示されます）

以下がセットアップされます

- Neovim
- Vim
- tmux
  - prefix key: `Ctrl-q`
- Git

## 使い方
### tmux
#### コピー
prefix key → `[` → 範囲選択（`space` or `Shift-v`で選択開始） → `y`

### Vim
#### コピー
`v` or `Shift-v` or `Ctrl-v` → 範囲選択 → `y`

#### ROS1補完
C++のROS補完有効化ビルド
- デバッグ情報付きのリリース・ビルド
- compile_commands.json出力 + シンボリックリンク作成
```bash
cmk_export_compile_commands        # 全てのパッケージ
cmk_export_compile_commands --this # 現在のパッケージ
```
ビルドせずに最低限のROS補完を有効化する場合</br>
- 以下のパスが追加されます
  - /opt/ros/noetic/include
  - \<target package>/include
```bash
cd <target package>
create_simple_compile_flags
```
注）pythonはデフォルトで有効化されている

#### 一部のキーバインド
| モード | キーバインド | 説明 |
| --- | --- | --- |
| Normal | `Ctrl-e`  | ファイルエクスプローラを開く・閉じる (`u`: 上のディレクトリに移動, `enter`: ファイル・ディレクトリを開く) |
|        | `Ctrl-w`  | 選択ウィンドウの変更 |
|        | `Ctrl-n`  | 次のタブのファイルに移動 |
|        | `Ctrl-p`  | 前のタブのファイルに移動 |
|        | `Shift-h` | ホーバー（関数定義などの情報）を表示 |
|        | `df`      | 定義へジャンプ |
|        | `rf`      | 参照へジャンプ |
|        | `rn`      | 名前変更 |
|        | `mne`     | 次のエラーへ移動 |
|        | `mpe`     | 前のエラーへ移動 |
| Insert | `Ctrl-n`  | 次の補完候補へ移動 |
|        | `↓`       | 〃 |
|        | `Ctrl-p`  | 前の補完候補へ移動 |
|        | `↑`       | 〃 |
|        | `Enter`   | 補完候補の選択 |
|        | `Tab`     | 〃 |

## Tips
### bashのterminalにgitのbranchを常に表示する設定
`~/.bashrc`に以下を追記
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\$ '
```


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
