BakerySchema = GraphQL::Schema.define(
  query: QueryType,
  mutation: MutationType
)

rails c

Rails.config.autoload_paths.grep /graph/
