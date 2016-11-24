MutationType = GraphQL::ObjectType.define do
  name 'MutationType'

  field :createBakery2, BakeryMutations::Create.field
end
