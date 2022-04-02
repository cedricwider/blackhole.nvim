local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

-- Exclude some filetypes from highlighting by using `!`
colorizer.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
}
