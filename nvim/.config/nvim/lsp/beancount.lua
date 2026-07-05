return {
  init_options = {
    journal_file = vim.fn.getcwd() .. '/ledger.beancount',
    formatting = {
      prefix_width = 30,
      num_width = 10,
      currency_column = 60,
      account_amount_spacing = 2,
      number_currency_spacing = 1,
    },
    completion = {
      fuzzy_match_accounts = true,
    },
    diagnostic_flags = { '!' },
  },
}
