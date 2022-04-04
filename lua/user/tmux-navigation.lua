local status_ok, tn = pcall(require, 'nvim-tmux-navigation')
if not status_ok then
  return
end

tn.setup {
  -- disable nvim tmux navigation when a tmux pane is zoomed
  disable_when_zoomed = false,
  -- keybindings for the navigation
  keybindings = {
    left =  "<A-h>",
    down =  "<A-j>",
    up =    "<A-k>",
    right = "<A-l>",
  },
}
