local ok, comment = pcall(require, 'Comment')
local ok_ts, ts_context_commentstring = pcall(require, 'ts_context_commentstring')
if not ok or not ok_ts then
  return
end

-- set up before Comment so its pre_hook can use it
ts_context_commentstring.setup {
  enable_autocmd = false,
}

comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
