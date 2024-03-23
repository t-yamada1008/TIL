# z

zplugを入れた後に、zshrcに

https://github.com/agkozak/zsh-z?tab=readme-ov-file#for-zim

の記述通りのことをする。

```zsh
# z
zplug "agkozak/zsh-z"
```

その後、コマンドで
zplug install
zplug load

### トラブルシュート

```sh
takatoshi@yamadatakatoshinoMacBook-Pro-2 TIL % zplug list
agkozak/zsh-z => none
takatoshi@yamadatakatoshinoMacBook-Pro-2 TIL % z doc
zsh: command not found: z
takatoshi@yamadatakatoshinoMacBook-Pro-2 TIL % zplug install
[zplug] no packages to install
takatoshi@yamadatakatoshinoMacBook-Pro-2 TIL % zplug load
zsh compinit: insecure files, run compaudit for list.
Ignore insecure files and continue [y] or abort compinit [n]? y
takatoshi@yamadatakatoshinoMacBook-Pro-2 TIL %
```

`zplug load`でいけた。
