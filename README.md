# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## 插件开发

在 lazyvim 中添加插件配置 可以通过 `lua/plugins/dev.lua` 定义本地开发中的插件加载规则

例如

```lua
return {
  {
    "my-unpublished-plugin",
    dir = "~/code/my-plugin", -- 本地路径
    dev = true,               -- 标记为开发模式
    config = function()
      require("my-plugin").setup()
    end
  }
}
```
