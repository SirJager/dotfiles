local M = {
  'hxueh/beancount.nvim',
  ft = { 'beancount', 'bean' },
}

M.opts = {
  -- Alignment & formatting
  separator_column = 10, -- Column for decimal separator alignment
  instant_alignment = true, -- Align amounts on decimal point entry
  fixed_cjk_width = false, -- Treat CJK characters as 2-width
  auto_format_on_save = true, -- Auto formatting file on saving
  auto_fill_amounts = false, -- Auto-fill missing amounts on save (opt-in)

  -- Completion & input
  complete_payee_narration = true, -- Include payees/narrations

  -- Files & paths
  main_bean_file = '', -- Path to main beancount file
  python_path = 'python', -- Python executable path

  -- Diagnostics & warnings
  flag_warnings = { -- Transaction flag warning levels
    ['*'] = nil, -- FLAG_OKAY - Transactions that have been checked
    ['!'] = vim.diagnostic.severity.WARN, -- FLAG_WARNING - Mark by user as something to be looked at later
    ['P'] = nil, -- FLAG_PADDING - Transactions created from padding directives
    ['S'] = nil, -- FLAG_SUMMARIZE - Transactions created due to summarization
    ['T'] = nil, -- FLAG_TRANSFER - Transactions created due to balance transfers
    ['C'] = nil, -- FLAG_CONVERSIONS - Transactions created to account for price conversions
    ['M'] = nil, -- FLAG_MERGING - A flag to mark postings merging together legs for average cost
  },
  auto_save_before_check = true, -- Auto-save before diagnostics

  -- Features
  inlay_hints = true, -- Show inferred amounts
  snippets = {
    enabled = true, -- Enable snippet support
    date_format = '%Y-%m-%d', -- Date format for snippets
  },

  -- Key mappings (customizable)
  keymaps = {
    goto_definition = 'gd', -- Go to definition
    next_transaction = ']]', -- Next transaction
    prev_transaction = '[[', -- Previous transaction
  },

  -- UI settings
  ui = {
    virtual_text = true, -- Show diagnostics as virtual text
    signs = true, -- Show diagnostic signs
    update_in_insert = false, -- Don't update while typing
    severity_sort = true, -- Sort by severity
  },
}

return M
