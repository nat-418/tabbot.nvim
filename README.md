tabbot.nvim
===========

![Abbot of Cui Yun Gong monastery plays Xiangqi](./abbot.jpg)

This is a simple Neovim plugin that makes working with tabs easier.
It pulls out the "tabs as workspaces" concept from my 
[DBM](https://github.com/nat-418/dbm.nvim) plugin and refines it,
shipping only two commands:

* `:TabbotGo {number}` Switches to the `{number}`th tab.
* `:TabbotSend {number}` Switches to tab `{number}` and loads the current
   buffer there.

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

