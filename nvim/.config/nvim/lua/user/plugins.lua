local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer manages itself
    use 'nvim-treesitter/nvim-treesitter' -- Better highlight
end)
