BakeryType = GraphQL::ObjectType.define do
  name "Bakery"
  description "A Bakery"
  field :id, types.ID
  field :name, types.String
  field :description, types.String
  field :user do
    type UserType
    resolve -> (obj, args, ctx) {
      obj.user
    }
  end
  field :created_at, types.String
end
