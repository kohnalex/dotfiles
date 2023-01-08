local session_ok, session = pcall(require, "auto-session")
if not session_ok then return end

session.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/Documents/Code/", "~/go/src/", "~/dotfiles/" },
})
