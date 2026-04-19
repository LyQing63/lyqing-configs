local function open_grug_far(prefills)
  local grug_far = require 'grug-far'

  if not grug_far.has_instance 'explorer' then
    grug_far.open { instanceName = 'explorer', prefills = prefills }
  else
    grug_far.get_instance('explorer'):open()
    grug_far.get_instance('explorer'):update_input_values(prefills, false)
  end
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<C-e>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    commands = {
      grug_far_replace = function(state)
        local node = state.tree:get_node()
        local prefills = {
          paths = node.type == 'directory' and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':p'))
            or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':h')),
        }
        open_grug_far(prefills)
      end,
      grug_far_replace_visual = function(_, selected_nodes, _)
        local paths = {}
        for _, node in pairs(selected_nodes) do
          local path = node.type == 'directory' and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':p'))
            or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':h'))
          table.insert(paths, path)
        end
        local prefills = { paths = table.concat(paths, '\n') }
        open_grug_far(prefills)
      end,
    },
    filesystem = {
      window = {
        mappings = {
          ['<C-e>'] = 'close_window',
          ['o'] = 'open',
          ['.'] = 'toggle_hidden',
          ['O'] = {
            'show_help',
            nowait = false,
            config = { title = 'Order by', prefix_key = 'O' },
          },
          ['Oc'] = { 'order_by_created', nowait = false },
          ['Od'] = { 'order_by_diagnostics', nowait = false },
          ['Og'] = { 'order_by_git_status', nowait = false },
          ['Om'] = { 'order_by_modified', nowait = false },
          ['On'] = { 'order_by_name', nowait = false },
          ['Os'] = { 'order_by_size', nowait = false },
          ['Ot'] = { 'order_by_type', nowait = false },
        },
      },
    },
    window = {
      mappings = {
        z = 'grug_far_replace',
      },
    },
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
