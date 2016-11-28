MutationType = GraphQL::ObjectType.define do
  name 'MutationType'

  field :createBakery2, BakeryMutation::Create.field
end
