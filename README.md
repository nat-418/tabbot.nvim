tabbot.nvim
===========

![Abbot of Cui Yun Gong monastery plays Xiangqi](./abbot.jpg)

This is a simple Neovim plugin that makes working with tabs easier.
It pulls out the "tabs as workspaces" concept from my 
[dbm.nvim](https://github.com/nat-418/dbm.nvim) plugin and refines it,
shipping only one command:

* `:Tabbot {subcommand} {number}`

The currently implemented subcommands are:
* `clear`             Clears out any empty buffers and therefore empty tabs.
* `go   {tab_number}` Move user to tab number `{tab_number}`.
* `send {tab_number}` Send current buffer to tab number `{tab_number}`.

Installation
------------

Using [Packer](https://github.com/wbthomason/packer.nvim):
```lua
use({
  'https://github.com/nat-418/tabbot.nvim',
  config = function()
    require('tabbot').setup()
  end
})
```

Configuration
-------------

There is no configuration.
