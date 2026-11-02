# config.nvim（work-lite）

工作用的輕量版設定：TypeScript / React / Vue / Liquid / Ruby on Rails。

## 新電腦安裝

### 1. 系統工具（Homebrew）

```sh
xcode-select --install          # C compiler + make（telescope-fzf-native、treesitter parser 編譯用）
brew install neovim git ripgrep fd tree-sitter-cli node
```

| 工具 | 用途 |
| --- | --- |
| `ripgrep` | Telescope `live_grep`（`<leader>fg`）、`grep_string` |
| `fd` | Telescope `find_files`（`<leader>fd`）更快 |
| `make` + C compiler | 編譯 `telescope-fzf-native`（fzf 排序演算法，**不需要另外裝 fzf CLI**） |
| `tree-sitter-cli` | nvim-treesitter main branch 安裝 parser 必備（要用 brew 裝，不要用 npm） |
| `node` | mason 安裝 vtsls / vue_ls / eslint / tailwind / prettier 等 |
| Nerd Font | 圖示（lualine、oil），終端機字型要設成 Nerd Font |

> **用 fnm 管 Node 的話**：上面的 `brew install` 拿掉 `node`，改成
>
> ```sh
> brew install fnm
> echo 'fnm env --use-on-cd | source' >> ~/.config/fish/config.fish   # zsh: eval "$(fnm env --use-on-cd)" 寫進 ~/.zshrc
> # 重開 terminal
> fnm install --lts
> fnm default lts-latest   # 一定要設預設版本，否則在專案外開 nvim 會找不到 node，mason 裝不了 LSP
> ```
>
> 注意：mason 裝的 LSP（vtsls、vue_ls、eslint…）會用「開 nvim 那個目錄生效的 node」執行。
> 專案 `.nvmrc` / `.node-version` 指定太舊的版本（< 18）時，LSP 可能起不來，用 `:checkhealth vim.lsp` 看錯誤。

### 2. Ruby（給 ruby_lsp）

macOS 內建的 Ruby 2.6 太舊，mason 會裝不起 `ruby-lsp`。先用公司專案指定的版本管理工具（rbenv / asdf / mise）裝好 Ruby 3.x，**再開 nvim**。

### 3. 拉設定

```sh
git clone https://github.com/OwLu0905/config.nvim ~/.config/nvim   # 或你的 repo 位置
cd ~/.config/nvim && git checkout work-lite
nvim
```

第一次開啟會自動：

- lazy.nvim 安裝所有 plugin（照 `lazy-lock.json` 的版本）
- mason 安裝 LSP + `prettier`、`stylua`（看 `:Mason` 進度）
- treesitter 下載並編譯 parser

都跑完後重開一次 nvim，`:checkhealth` 檢查一下。

## 語言支援

| 語言 | LSP | Format on save |
| --- | --- | --- |
| TS / JS / React | `vtsls`、`eslint`、`tailwindcss` | prettier（專案有 prettier 設定才跑） |
| Vue 3 | `vue_ls` + `vtsls`（`@vue/typescript-plugin`） | prettier |
| HTML / CSS / JSON | `html`、`cssls`、`jsonls` | prettier |
| Ruby / Rails | `ruby_lsp` | ruby_lsp（專案有 rubocop / standard 時用它們） |
| ERB | `herb_ls` | — |
| Liquid | `shopify_theme_ls`（含 Theme Check） | — |
| Lua | `lua_ls` | stylua |

> prettier 設了 `require_cwd = true`：沒有 `.prettierrc` / `package.json` 的 prettier 設定時不會格式化，避免把公司既有檔案整份改掉。
