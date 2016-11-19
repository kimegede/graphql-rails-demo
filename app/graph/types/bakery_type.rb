BakeryType = GraphQL::ObjectType.define do
  name "Bakery"
  description "A Bakery"
  field :name, types.String
  field :description, types.String
  # field :author do
  #   type AuthorType
  #   resolve -> (obj, args, ctx) {
  #     obj.author
  #   }
  # end
end
