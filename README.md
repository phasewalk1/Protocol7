## Just a Hack
__presentday__ is _just a hack_. It's a simple neovim configuration written in _pure [Fennel](https://fennel-lang.org)_. It is not meant to be daily-driven, nor was it written as a framework to be expanded upon.
It's _just a simple config_ that demonstrates a method for embedding _Fennel_ as compiled _Lua_ code.

## How Does _presentday_ Work?
_presentday_ employs the following directory structure and a `Makefile` for building _Fennel_ source code into compiled _Lua_. The `Makefile` will recursively compile all `.fnl` code
present in the `src/` dir, and output it's correlated `.lua` module in the `build/` dir (e.g. `src/x.fnl` gets compiled to `build/x.lua`).

#### Before running `make`
```sh
.
├── Makefile
├── lazy-lock.json
└── src
    ├── configs
    │   ├── autopair.fnl
    │   ├── conjure.fnl
    │   ├── dash.fnl
    │   ├── lsp.fnl
    │   ├── mason.fnl
    │   ├── telescope.fnl
    │   ├── theme.fnl
    │   └── treesitter.fnl
    ├── globals.fnl
    ├── init.fnl
    └── plugins.fnl

```
#### After running `make`
```sh
.
├── Makefile
├── build
│   ├── configs
│   │   ├── autopair.lua
│   │   ├── conjure.lua
│   │   ├── dash.lua
│   │   ├── lsp.lua
│   │   ├── mason.lua
│   │   ├── telescope.lua
│   │   ├── theme.lua
│   │   └── treesitter.lua
│   ├── globals.lua
│   └── plugins.lua
├── init.lua
├── lazy-lock.json
└── src
    ├── configs
    │   ├── autopair.fnl
    │   ├── conjure.fnl
    │   ├── dash.fnl
    │   ├── lsp.fnl
    │   ├── mason.fnl
    │   ├── telescope.fnl
    │   ├── theme.fnl
    │   └── treesitter.fnl
    ├── globals.fnl
    ├── init.fnl
    └── plugins.fnl
```

The compiled `init.lua` is placed at the root folder, while all other modules are stored in `build/`.

### Plugins
Plugins are defined in `plugins.fnl`, with their relevant options being defined in `configs/x.fnl`:
```Fennel
(local plug {})

(lambda push-plugin [identifier opts]
  (if (= opts {})
    (table.insert plug identifier)
    (do
      (let [plugin-spec {}]
        (table.insert plugin-spec identifier)
        (each [k v (pairs opts)]
          (tset plugin-spec k v))
        (table.insert plug plugin-spec)))))

(lambda plugins []
    (push-plugin "folke/neoconf.nvim"               {:cmd "Neoconf"})
    (push-plugin "olical/conjure"                   (require :configs.conjure))
    (push-plugin "nvim-treesitter/nvim-treesitter"  (require :configs.treesitter))
    (push-plugin "williamboman/mason.nvim"          (require :configs.mason))
    (push-plugin "nyoom-engineering/oxocarbon.nvim" (require :configs.theme))
    (push-plugin "neovim/nvim-lspconfig"            (require :configs.lsp))
    (push-plugin "windwp/nvim-autopairs"            (require :configs.autopair))
    (push-plugin "glepnir/dashboard-nvim"           (require :configs.dash))
    (push-plugin "nvim-telescope/telescope.nvim"    (require :configs.telescope))
    (push-plugin "folke/neodev.nvim"                {})
    (push-plugin "folke/which-key.nvim"             {})
  plug)

(plugins)
```

