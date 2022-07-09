local status_ok, vimags = pcall(require, "vim-ags")
if not status_ok then
  return
end


-- g:ags_agexe = 'rg'
--
-- g:ags_agargs = {
--    '--column'         : ['', ''],
--    '--line-number'    : ['', ''],
--    '--context'        : ['g:ags_agcontext', '-C'],
--    '--max-count'      : ['g:ags_agmaxcount', ''],
--    '--heading'        : ['',''],
--    '--smart-case'     : ['','-S'],
--    '--color'          : ['always',''],
--    '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],

