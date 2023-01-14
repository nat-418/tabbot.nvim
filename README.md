tabbot.nvim ☯️
==============

Tabbot is a simple Neovim plugin that makes working with tabs easier.
Tabbot pulls out the "tabs as workspaces" concept from my 
[dbm.nvim](https://github.com/nat-418/dbm.nvim) plugin and refines it,
shipping only one command:

* `:Tabbot {subcommand} {number}`

The currently implemented subcommands are:
* `clear`             Clears out any empty buffers and therefore empty tabs.
* `go   {tab_number}` Move user to tab number `{tab_number}`.
* `send {tab_number}` Send current buffer window to tab number `{tab_number}`.

Installation
------------

```sh
$ git clone --depth 1 https://github.com/nat-418/tabbot.nvim ~/.local/share/nvim/site/pack/tabbot/start/tabbot.nvim
```

Configuration
-------------

There is no configuration.

See also
--------

* [bufala.nvim](https://github.com/nat-418/bufala.nvim) to work with buffers,
  windows, and splits like in a tiling window manager.
