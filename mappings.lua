-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["J"] = { "5j", desc = "向下移动五行" },
    ["K"] = { "5k", desc = "向上移动五行" },
    ["<leader>h"] = { "^", desc = "到最左边" },
    ["<leader>l"] = { "$", desc = "到最右边" },
    ["<leader>p"] = { "J", desc = "将下一行移动到当前行" },
    ["<leader>a"] = { function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
       end
     end, desc = "打开tree目录" },
    
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["R"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "下一个标签页" },
    ["E"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "上一个标签页"},
    ["<C-m>"] = { function() vim.lsp.buf.code_action() end, desc = "LSP code action",},
    ["gh"] = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details"},
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v = {
    ["<leader>h"] = { "^", desc = "到最左边" },
    ["<leader>l"] = { "$", desc = "到最右边" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
