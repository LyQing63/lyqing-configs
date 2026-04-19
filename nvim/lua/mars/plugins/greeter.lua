local intro_logo = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠶⠛⠋⠉⠐⠻⣷⣊⠉⠀⠀⠯⣔⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠙⢤⣶⣋⣀⣀⠁⠀⠙⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣄⣀⡀⠀⠀⠁⠢⢄⠑⣤⡀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠋⠀⡀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠄⠀⠀⠀⠙⣄⠈⣙⠲⢤⡀⠀⠑⢌⣻⣄⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⢠⠎⠀⡠⡾⠀⠀⠀⠀⠀⢀⣤⠖⠉⠀⠀⠀⠀⣠⠖⠉⠣⠈⠑⠀⠈⠑⠄⠀⠉⢿⣦⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⣞⣠⠞⡰⠁⠀⠀⡀⣠⣾⠟⠁⠀⠀⠀⠀⢰⠞⠀⠀⡄⠀⡀⠘⣄⠀⠀⠢⡀⢀⠢⠙⣧⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⢸⣿⢇⡴⠁⠀⡆⠈⢠⡿⠛⢳⡄⢀⠇⠀⢠⠞⠀⠀⢰⠁⠀⢧⠀⢻⠱⣦⢰⡞⢧⣀⠀⠘⣧⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⡼⢡⣿⠃⠀⢠⡇⣰⠋⠀⢰⠏⢠⠏⠀⣰⠋⠀⠀⢠⡟⠀⠘⠀⠇⢸⠀⠈⢻⡳⡤⣈⣷⠀⠸⣆       ',
  '      ⠀⠀⠀⠀⠀⢸⣷⣏⡇⠀⠀⢸⢠⢿⠟⠀⣏⡴⢃⡄⢠⠃⠀⠀⠀⢸⠃⠀⠀⠀⠀⢸⡇⠘⡇⠹⣼⠀⢻⠀⡄⢸       ',
  '      ⠀⠀⠀⠀⠀⠈⡟⢸⠁⣰⡇⣸⠘⢦⠤⢶⡏⢀⡼⡇⢸⠀⠀⠀⢀⡏⠀⠀⠀⠀⡀⣼⣧⠀⡇⠀⠈⣦⡼⠀⣇⢸       ',
  '      ⠀⠀⠀⠀⠀⠀⡇⠈⣰⠋⡇⡟⠀⠀⢰⣿⣁⡾⠁⢹⣼⣧⡇⠀⡜⠀⠀⣠⠆⣼⣰⢿⣿⢰⠇⠀⣸⠏⣰⢀⣿⣿       ',
  '      ⠀⠀⠀⠀⠀⠀⢣⣰⣿⡀⢹⣿⠀⠀⣾⣿⣿⣟⣒⣺⣿⢼⣧⣼⠁⣠⣶⠏⣰⣿⣯⣼⣿⣿⠀⣴⣯⣴⡿⣼⠹⡿       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⢻⣿⣧⢠⣿⡀⣸⡏⠿⢿⣿⣿⠙⠻⠆⣿⣧⣾⣿⣯⣴⣿⣿⡟⠻⣿⣷⣾⣿⣿⢿⣿⠃⢰⠇       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣧⡻⣇⣿⣿⣄⠀⠈⠁⠀⠀⣸⡿⢋⠟⣹⡿⠋⠛⠛⠁⢠⣿⣿⣿⣿⡇⣸⠃⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣮⡻⣷⢤⣀⠀⠸⠟⠁⠀⠜⠁⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⡇⠁⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⠿⠮⢽⣿⣦⡀⠁⠀⠀⠀⠀⣰⠄⠀⠈⢉⣡⣾⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⠉⠀⠀⠀⠀⠀⠉⢻⡶⠦⠀⠀⠄⠅⠀⠐⠚⣻⣿⣿⣿⣿⣿⢛⡏⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡒⠀⠀⠀⢀⣠⣶⣿⣿⣿⡿⠋⣿⠋⠘⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⢀⣠⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣦⡤⠖⠉⠉⠟⣹⠟⠋⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⢀⠴⠊⣹⡟⠀⠀⣰⢾⣿⣷⣆⠀⠀⠀⠀⠀⢀⡿⠛⠃⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⢠⠎⠀⣰⣿⡇⠀⡷⣿⠿⠿⣟⣿⠀⠀⠀⠀⠀⣼⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⣠⣿⣿⡇⠀⢿⣮⣗⠒⠛⠁⠀⠀⠀⠀⠸⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠘⠛⠛⣿⣿⣿⡇⠀⠈⠣⠀⠀⠀⠀⠀⠀⢀⣄⣴⢿⣿⣿⡌⠑⠢⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⢸⡆⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡏⠀⠻⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ',
  '            Press <Ctrl-P> to open files               ',
  '               Type :q to Exit Neovim                  ',
  '                                                       ',
  '                   Config By Mars                      ',
}

local PLUGIN_NAME = 'mars-greeter'
local DEFAULT_COLOR = '#848db8'
local INTRO_LOGO_HEIGHT = #intro_logo
local INTRO_LOGO_WIDTH = 55

local autocmd_group = vim.api.nvim_create_augroup(PLUGIN_NAME, {})
local highlight_ns_id = vim.api.nvim_create_namespace(PLUGIN_NAME)
local greeter_buff = -1

local function unlock_buf(buf)
  vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
end

local function lock_buf(buf)
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
end

local function draw_greeter(buf, logo_width, logo_height)
  local window = vim.fn.bufwinid(buf)
  local screen_width = vim.api.nvim_win_get_width(window)
  local screen_height = vim.api.nvim_win_get_height(window) - vim.opt.cmdheight:get()

  local start_col = math.floor((screen_width - logo_width) / 2)
  local start_row = math.floor((screen_height - logo_height) / 2)
  if start_col < 0 or start_row < 0 then
    return
  end

  local top_space = {}
  for _ = 1, start_row do
    table.insert(top_space, '')
  end

  local col_offset_spaces = {}
  for _ = 1, start_col do
    table.insert(col_offset_spaces, ' ')
  end
  local col_offset = table.concat(col_offset_spaces, '')

  local adjusted_logo = {}
  for _, line in ipairs(intro_logo) do
    table.insert(adjusted_logo, col_offset .. line)
  end

  unlock_buf(buf)
  vim.api.nvim_buf_set_lines(buf, 1, 1, true, top_space)
  vim.api.nvim_buf_set_lines(buf, start_row, start_row, true, adjusted_logo)
  lock_buf(buf)

  vim.api.nvim_buf_set_extmark(buf, highlight_ns_id, start_row, start_col, {
    end_row = start_row + INTRO_LOGO_HEIGHT,
    hl_group = 'Default',
  })
end

local function create_and_set_greeter_buf(default_buff)
  local intro_buff = vim.api.nvim_create_buf('nobuflisted', 'unlisted')
  vim.api.nvim_buf_set_name(intro_buff, PLUGIN_NAME)
  vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = intro_buff })
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = intro_buff })
  vim.api.nvim_set_option_value('filetype', 'greeter', { buf = intro_buff })
  vim.api.nvim_set_option_value('swapfile', false, { buf = intro_buff })

  vim.api.nvim_set_current_buf(intro_buff)
  vim.api.nvim_buf_delete(default_buff, { force = true })

  return intro_buff
end

local function set_options()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.list = false
  vim.opt_local.fillchars = { eob = ' ' }
  vim.opt_local.colorcolumn = '0'
end

local function redraw()
  unlock_buf(greeter_buff)
  vim.api.nvim_buf_set_lines(greeter_buff, 0, -1, true, {})
  lock_buf(greeter_buff)
  draw_greeter(greeter_buff, INTRO_LOGO_WIDTH, INTRO_LOGO_HEIGHT)
end

local function display_greeter(payload)
  local is_dir = vim.fn.isdirectory(payload.file) == 1

  local default_buff = vim.api.nvim_get_current_buf()
  local default_buff_name = vim.api.nvim_buf_get_name(default_buff)
  local default_buff_filetype = vim.api.nvim_get_option_value('filetype', { buf = default_buff })

  -- Skip if not a directory and buffer has a name or content
  if not is_dir and default_buff_name ~= '' and default_buff_filetype ~= PLUGIN_NAME then
    return
  end

  -- Skip if buffer has content (like Lazy installation buffer)
  local line_count = vim.api.nvim_buf_line_count(default_buff)
  local first_line = vim.api.nvim_buf_get_lines(default_buff, 0, 1, false)[1]
  if line_count > 1 or (first_line and first_line ~= '') then
    return
  end

  -- Skip for special filetypes (lazy, mason, etc.)
  local special_filetypes = { 'lazy', 'mason', 'TelescopePrompt', 'help' }
  for _, ft in ipairs(special_filetypes) do
    if default_buff_filetype == ft then
      return
    end
  end

  greeter_buff = create_and_set_greeter_buf(default_buff)
  set_options()

  draw_greeter(greeter_buff, INTRO_LOGO_WIDTH, INTRO_LOGO_HEIGHT)

  vim.api.nvim_create_autocmd({ 'WinResized', 'VimResized' }, {
    group = autocmd_group,
    buffer = greeter_buff,
    callback = redraw,
  })
end

return {
  dir = vim.fn.stdpath 'config' .. '/lua/mars/plugins',
  name = 'mars-greeter',
  lazy = false,
  priority = 100,
  config = function()
    vim.api.nvim_set_hl(highlight_ns_id, 'Default', { fg = DEFAULT_COLOR })
    vim.api.nvim_set_hl_ns(highlight_ns_id)

    vim.api.nvim_create_autocmd('VimEnter', {
      group = autocmd_group,
      callback = display_greeter,
      once = true,
    })
  end,
}
