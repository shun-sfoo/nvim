# nvim

## font

- [x] `operator & font-meslo-lg-nerd-font` osx

## required

- brew install lolcat
- yarn global add --dev --exact prettier
- yarn glboal add @appguru/luafmt

## TODO

- dap
- remap keys

## vimwiki

- `<Leader>ww` 打开默认的 wiki 目录文件
- `<Leader>wt` 在新标签（Tab）中打开 wiki 目录文件
- `<Leader>ws` 在多个 wiki 中选择并打开该 wiki 的目录文件
- `<Leader>wd` 删除当前 wiki 文件
- `<Leader>wr` 重命名当前 wiki 文件
- `<Enter>` 创建或打开 wiki 链接
- `<Shift-Enter>` 先上下分屏再打开 wiki 链接（若非链接则先创建）
- `<Ctrl-Enter>` 先左右分屏再打开 wiki 链接（若非链接则先创建）
- `<Backspace>` 返回之前浏览的 wiki 文件
- `<Tab> ` 跳到本文件中下一个 wiki 链接
- `<Shift-Tab>` 跳到本文件中上一个 wiki 链接

更多快捷键说明, `:h vimwiki-mappings`

## vimwiki cheatsheet

### wiki management

| action                 |                                 |
| ---------------------- | ------------------------------- |
| `[number] <leader> ww` | open wiki index file            |
| `[number] <leader> wt` | open wiki index file in new tab |
| `<leader> ws`          | list and select available wikis |
| `<leader> wd`          | delete wiki page                |
| `<leader> wr`          | rename wiki page                |

### diary management

| action                           |                                             |
| -------------------------------- | ------------------------------------------- |
| `[number] <leader> wi`           | open diary index file for wiki              |
| `<leader> w <leader> i`          | update current diary index                  |
| `[number] <leader> w <leader> w` | open today’s diary file for wiki            |
| `[number] <leader> w <leader> t` | open today’s diary file for wiki in new tab |
| `<C-Up>`                         | open previous day’s diary                   |
| `<C-Down>`                       | open next day’s diary                       |

### editing shortcuts

| action        |                              |
| ------------- | ---------------------------- |
| `<C-Space>`   | toggle list item on/off      |
| `= `          | add header level             |
| `-`           | remove header level          |
| `+`           | create/decorate links        |
| `glm`         | increase indent of list item |
| `gll`         | decrease indent of list item |
| `gl\* or gl8` | switch or insert “\*” symbol |
| `gl# or gl3`  | switch or insert “#” symbol  |
| `gl-`         | switch or insert “-” symbol  |
| `gl1`         | switch or insert “1.” symbol |
