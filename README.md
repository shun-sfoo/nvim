# nvim

## support

lua lsp support by `sumneko_lua`

rust lsp support by `rust-analyzer`

file finder by `telescope.nvim`

## font

- [x] `operator & font-meslo-lg-nerd-font` osx

## required

- `brew install lolcat`
- `npm install -g --save-dev --save-exact prettier`
- `npm install -g lua-fmt`
  or (need to test)
- `yarn global add --dev --exact prettier`
- `yarn global add lua-fmt`

## TODO

- dap

## git

git 克隆包含子项目的仓库

`git clone --recursive https://github.com/example/example.git`

## vim-sandwich

### quick start

#### Add

Press `sa{motion/textobject}{addition}`. For example, a key sequence `saiw(` makes `foo` to `(foo)`.

#### Delete

Press `sdb` or `sd{deletion}`. For example, key sequences `sdb` or `sd(` makes `(foo)` to `foo`. sdb searches a set of surrounding automatically.

#### Replace

Press `srb{addition}` or `sr{deletion}{addition}`. For example, key sequences `srb"` or `sr("` makes `(foo)` to `"foo"`.

### textobj-sandwich

Search and select a sandwiched text automatically: mapped to the key sequence `ib` and `ab`.

Search and select a sandwiched text with query: mapped to the key sequence `is` and `as`.

`ib` and `is` selects {surrounded text}. `ab` and `as` selects {surrounded text} including {surrounding}s.

```
             |<----ib,is---->|
{surrounding}{surrounded text}{surrounding}
|<-----------------ab,as----------------->|
```
