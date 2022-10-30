local hop_ok, hop = pcall(require, "hop")
if not hop_ok then return end

hop.setup({
  key = "etovxqpdygfblzhckisuran",
})

require("user.plugins.keymaps").setup_hop_keymaps()
