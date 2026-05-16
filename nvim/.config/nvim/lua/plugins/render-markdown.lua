local M = {
  'MeanderingProgrammer/render-markdown.nvim',
  main = 'render-markdown',
  name = 'render-markdown',
  ft = {
    'markdown',
    'mdx',
    'mdoc',
    'org',
    'vimwiki',
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

M.opts = {
  completions = { lsp = { enabled = true } },
  heading = {
    enabled = true,
    render_modes = false,
    sign = true,
    icons = {
      '󰉫 ',
      '󰉬 ',
      '󰉭 ',
      '󰉮 ',
      '󰉯 ',
      '󰉰 ',
    },
    position = 'overlay', -- right | inline | overlay
    signs = {
      '󰫎 ',
    },
    width = 'full', -- default: full | block
    left_margin = 0, -- can also be a list of numbers
    left_pad = 0, -- can also be a list of numbers
    right_pad = 0,
    min_width = 0,
    border = false,
    border_virtual = false,
    border_prefix = false,
    above = '▄',
    below = '▀',
    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
  },
  paragraph = {
    enabled = true,
    render_modes = false,
    left_margin = 0,
    min_width = 0,
  },
  code = {
    enabled = true,
    render_modes = false,
    sign = true,
    style = 'full', -- none | normal | language | full - default
    position = 'left',
    language_pad = 2,
    language_name = true,
    disable_background = {
      'diff',
    },
    width = 'block', -- block | full -- default
    left_margin = 0,
    left_pad = 2,
    right_pad = 2,
    min_width = 50,
    border = 'thin', -- none | thick | thin -- default
    above = '▄',
    below = '▀',
    highlight = 'RenderMarkdownCode',
    highlight_language = nil,
    inline_pad = 0,
    highlight_inline = 'RenderMarkdownCodeInline',
  },
  dash = {
    enabled = true,
    render_modes = false,
    -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
    -- The icon gets repeated across the window's width
    icon = '─',
    width = 'full', -- <number> hard coded value | full --default
    left_margin = 0,
    highlight = 'RenderMarkdownDash',
  },
  bullet = {
    enabled = true,
    render_modes = false,
    -- Replaces '-'|'+'|'*' of 'list_item'
    icons = {
      '●',
      '○',
      '◆',
      '◇',
    },
    left_pad = 0,
    right_pad = 0,
    highlight = 'RenderMarkdownBullet',
  },
  checkbox = {
    enabled = true,
    render_modes = false,
    position = 'inline', -- overlay | inline -- default
    unchecked = {
      icon = ' ', -- replaces '[ ]' of 'task_list_marker_unchecked'
      highlight = 'RenderMarkdownUnchecked',
      scope_highlight = nil,
    },
    checked = {
      icon = '󰄳 ', -- replaces '[x]' of 'task_list_marker_checked'
      highlight = 'RenderMarkdownChecked', -- Highlight for the checked icon
      scope_highlight = nil, -- Highlight for item associated with checked checkbox
    },
    custom = {
      todo = {
        raw = '[-]',
        rendered = '󰥔 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      cancel = {
        raw = '[/]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      cross = {
        raw = '[n]',
        rendered = '󰅙 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      check = {
        raw = '[x]',
        rendered = '󰄳 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      right = {
        raw = '[>]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      left = {
        raw = '[<]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      info = {
        raw = '[i]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      question = {
        raw = '[?]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      add = {
        raw = '[+]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      remove = {
        raw = '[-]',
        rendered = ' ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      quote = {
        raw = "[']",
        rendered = '󰸥 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      alert = {
        raw = '[!]',
        rendered = '󰀨 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      star = {
        raw = '[*]',
        rendered = '󰓏 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      fire = {
        raw = '[^]',
        rendered = '󱠇 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_0 = {
        raw = '[0]',
        rendered = '󰲟 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_1 = {
        raw = '[1]',
        rendered = '󰲡 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_2 = {
        raw = '[2]',
        rendered = '󰲣 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_3 = {
        raw = '[3]',
        rendered = '󰲥 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_4 = {
        raw = '[4]',
        rendered = '󰲧 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_5 = {
        raw = '[5]',
        rendered = '󰲩 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_6 = {
        raw = '[6]',
        rendered = '󰲫 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_7 = {
        raw = '[7]',
        rendered = '󰲭 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_8 = {
        raw = '[8]',
        rendered = '󰲯 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
      number_9 = {
        raw = '[9]',
        rendered = '󰲱 ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil,
      },
    },
  },
  quote = {
    enabled = true,
    render_modes = false,
    icon = '▋',
    repeat_linebreak = false,
    highlight = 'RenderMarkdownQuote',
  },
  pipe_table = {
    enabled = true,
    render_modes = false,
    preset = 'double', -- heavy | double | round | none -- default
    style = 'full', -- none | normal | full -- default
    cell = 'raw', -- overlay | raw | trimmer | padded --default
    padding = 0,
    min_width = 0,
        -- stylua: ignore
        border = {
            '╭',
            '┬',
            '╮',
            '├',
            '┼',
            '┤',
            '╰',
            '┴',
            '╯',
            '│',
            '─'
         },
    alignment_indicator = '━',
    head = 'RenderMarkdownTableHead',
    row = 'RenderMarkdownTableRow',
    filler = 'RenderMarkdownTableFill',
  },
  callout = {
    note = {
      raw = '[!NOTE]',
      rendered = '󰋽 Note',
      highlight = 'RenderMarkdownInfo',
    },
    tip = {
      raw = '[!TIP]',
      rendered = '󰌶 Tip',
      highlight = 'RenderMarkdownSuccess',
    },
    important = {
      raw = '[!IMPORTANT]',
      rendered = '󰅾 Important',
      highlight = 'RenderMarkdownHint',
    },
    warning = {
      raw = '[!WARNING]',
      rendered = '󰀪 Warning',
      highlight = 'RenderMarkdownWarn',
    },
    caution = {
      raw = '[!CAUTION]',
      rendered = '󰳦 Caution',
      highlight = 'RenderMarkdownError',
    },
    -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
    abstract = {
      raw = '[!ABSTRACT]',
      rendered = '󰨸 Abstract',
      highlight = 'RenderMarkdownInfo',
    },
    summary = {
      raw = '[!SUMMARY]',
      rendered = '󰨸 Summary',
      highlight = 'RenderMarkdownInfo',
    },
    tldr = {
      raw = '[!TLDR]',
      rendered = '󰨸 Tldr',
      highlight = 'RenderMarkdownInfo',
    },
    info = {
      raw = '[!INFO]',
      rendered = '󰋽 Info',
      highlight = 'RenderMarkdownInfo',
    },
    todo = {
      raw = '[!TODO]',
      rendered = '󰗡 Todo',
      highlight = 'RenderMarkdownInfo',
    },
    hint = {
      raw = '[!HINT]',
      rendered = '󰌶 Hint',
      highlight = 'RenderMarkdownSuccess',
    },
    success = {
      raw = '[!SUCCESS]',
      rendered = '󰄬 Success',
      highlight = 'RenderMarkdownSuccess',
    },
    check = {
      raw = '[!CHECK]',
      rendered = '󰄬 Check',
      highlight = 'RenderMarkdownSuccess',
    },
    done = {
      raw = '[!DONE]',
      rendered = '󰄬 Done',
      highlight = 'RenderMarkdownSuccess',
    },
    question = {
      raw = '[!QUESTION]',
      rendered = '󰘥 Question',
      highlight = 'RenderMarkdownWarn',
    },
    help = {
      raw = '[!HELP]',
      rendered = '󰘥 Help',
      highlight = 'RenderMarkdownWarn',
    },
    faq = {
      raw = '[!FAQ]',
      rendered = '󰘥 Faq',
      highlight = 'RenderMarkdownWarn',
    },
    attention = {
      raw = '[!ATTENTION]',
      rendered = '󰀪 Attention',
      highlight = 'RenderMarkdownWarn',
    },
    failure = {
      raw = '[!FAILURE]',
      rendered = '󰅖 Failure',
      highlight = 'RenderMarkdownError',
    },
    fail = {
      raw = '[!FAIL]',
      rendered = '󰅖 Fail',
      highlight = 'RenderMarkdownError',
    },
    missing = {
      raw = '[!MISSING]',
      rendered = '󰅖 Missing',
      highlight = 'RenderMarkdownError',
    },
    danger = {
      raw = '[!DANGER]',
      rendered = '󱐌 Danger',
      highlight = 'RenderMarkdownError',
    },
    error = {
      raw = '[!ERROR]',
      rendered = '󱐌 Error',
      highlight = 'RenderMarkdownError',
    },
    bug = {
      raw = '[!BUG]',
      rendered = '󰨰 Bug',
      highlight = 'RenderMarkdownError',
    },
    example = {
      raw = '[!EXAMPLE]',
      rendered = '󰉹 Example',
      highlight = 'RenderMarkdownHint',
    },
    quote = {
      raw = '[!QUOTE]',
      rendered = '󱆨 Quote',
      highlight = 'RenderMarkdownQuote',
    },
    cite = {
      raw = '[!CITE]',
      rendered = '󱆨 Cite',
      highlight = 'RenderMarkdownQuote',
    },
  },
  link = {
    enabled = true,
    render_modes = false,
    footnote = {
      superscript = true,
      prefix = '',
      suffix = '',
    },
    image = '󰥶 ',
    email = '󰀓 ',
    hyperlink = '󰌹 ',
    highlight = 'RenderMarkdownLink',
    wiki = {
      icon = '󱗖 ',
      highlight = 'RenderMarkdownWikiLink',
    },
    custom = {
      web = {
        pattern = '^http',
        icon = '󰖟 ',
      },
      youtube = {
        pattern = 'youtube%.com',
        icon = '󰗃 ',
      },
      github = {
        pattern = 'github%.com',
        icon = '󰊤 ',
      },
      neovim = {
        pattern = 'neovim%.io',
        icon = ' ',
      },
      stackoverflow = {
        pattern = 'stackoverflow%.com',
        icon = '󰓌 ',
      },
      discord = {
        pattern = 'discord%.com',
        icon = '󰙯 ',
      },
      reddit = {
        pattern = 'reddit%.com',
        icon = '󰑍 ',
      },
    },
  },
  sign = {
    enabled = true,
    highlight = 'RenderMarkdownSign',
  },
  indent = {
    enabled = false,
    render_modes = false,
    per_level = 2,
    skip_level = 1,
    skip_heading = false,
  },
}

return M
