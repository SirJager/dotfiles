local M = {}

function M.config()
  require("cmp-graphql").setup {
    schema_path = "graphql.schema.json",
  }
end

return M
