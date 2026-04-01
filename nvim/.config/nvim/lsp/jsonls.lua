return {
  settings = {
    json = {
      validate = { enable = true },
      schemas = require('schemastore').json.schemas {
        extra = {
          {
            name = 'biome.json',
            fileMatch = 'biome.json',
            description = 'Biome, Fast formatter and linter writter in rust',
            url = 'https://biomejs.dev/schemas/1.8.3/schema.json',
          },
          {
            name = 'project.json',
            fileMatch = { 'project.json', 'package.json' },
            description = 'Nx, Project level configuration files',
            url = 'https://raw.githubusercontent.com/nrwl/nx/refs/heads/master/packages/nx/schemas/project-schema.json',
          },
          {
            name = 'nx.json',
            fileMatch = 'nx.json',
            description = 'Nx configuration file',
            url = 'https://raw.githubusercontent.com/nrwl/nx/refs/heads/master/packages/nx/schemas/nx-schema.json',
          },
          {
            name = 'turbo.json',
            fileMatch = 'turbo.json',
            description = 'Turbo repo schema',
            url = 'https://turborepo.dev/schema.json',
          },
        },
      },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
        end,
      },
    },
  },
}
