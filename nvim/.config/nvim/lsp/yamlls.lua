return {
  yaml = {
    schemastore = {
      enable = true,
    },
    validate = { enable = true },
    schemas = require("schemastore").yaml.schemas {
      extra = {
        {
          description = "Taskfile schema",
          fileMatch = "Taskfile.yaml",
          name = "Taskfile.yaml",
          url = "https://taskfile.dev/schema.json",
        },
      },
    },
  },
}
