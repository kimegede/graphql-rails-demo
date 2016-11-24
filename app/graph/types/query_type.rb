QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  # field :bakery, BakeryType, field: FetchField.new(type: BakeryType, model: Bakery)
  field :bakery do
    type BakeryType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Bakery.find(args[:id])
    }
  end
end
