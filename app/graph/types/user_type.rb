UserType = GraphQL::ObjectType.define do
  name "User"
  description "Creator of bakery"
  field :id, types.Int
  field :email, types.String
end
