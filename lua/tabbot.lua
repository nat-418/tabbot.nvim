local M = {}

M.clear = function()
  local last_buffer = vim.fn.bufnr('$')

  for buffer_number = 1, last_buffer, 1 do
    local buffer_name   = vim.fn.bufname(buffer_number)
    local buffer_exists = vim.fn.bufexists(buffer_number)
    local buffer_valid  = vim.api.nvim_buf_is_valid(buffer_number)

    if buffer_name == '' and buffer_exists and buffer_valid then
      vim.api.nvim_buf_delete(buffer_number, {force = true})
    end
  end

  return 1
end

M.go = function(target_tab_number)
  local tab_table = vim.api.nvim_list_tabpages()

  if tonumber(target_tab_number) > #tab_table then
    vim.api.nvim_command('$tabnew')

    return M.go(target_tab_number) -- Proper tail call 😎
  end

  return vim.api.nvim_command(target_tab_number .. 'tabnext')
end

M.send = function(target_tab_number)
  local bufname = vim.fn.bufname()

  M.go(target_tab_number)

  vim.api.nvim_command('buffer ' .. bufname)
end

M.cmd = function(args)
  local string2list = function(string)
    local list = {}
    for each in string:gmatch("%w+") do table.insert(list, each) end
    return list
  end

  local parsed = string2list(args.args)

  local subcmd = parsed[1]
  local arg1   = parsed[2]

  if subcmd == 'clear' then M.clear()    end
  if subcmd == 'go'    then M.go(arg1)   end
  if subcmd == 'send'  then M.send(arg1) end
end

M.setup = function()
  local completion = function(_, _, _)
    return {
      'clear',
      'go',
      'send'
    }
  end

  vim.api.nvim_create_user_command(
    'Tabbot',
    function(args) M.cmd(args) end,
    {nargs = '*', complete = completion}
  )
end

return M
