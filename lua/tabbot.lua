local M = {}

M.go = function(target_tab_number)
  local tab_table = vim.api.nvim_list_tabpages()

  if target_tab_number > #tab_table then
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

M.setup = function()
  local tabCompletion = function(_, _, _)
    local tab_table = vim.api.nvim_list_tabpages()
    local cmp_table = {}

    for k, v in pairs(tab_table) do
      cmp_table[k] = tostring(v)
    end

    return cmp_table
  end

  vim.api.nvim_create_user_command(
    'TabbotGo',
    function(opts)
      M.go(tonumber(opts.args))
    end,
    {
      nargs = 1,
      complete = tabCompletion
    }
  )

  vim.api.nvim_create_user_command(
    'TabbotSend',
    function(opts) M.send(tonumber(opts.args)) end,
    {
      nargs = 1,
      complete = tabCompletion
    }
  )
end

return M
