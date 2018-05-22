# BakeryMutation = GraphQL::ObjectType.define do
#   name "BakeryMutation"
#
#   field :createBakery do
#     type BakeryType
#     argument :name, !types.String
#     argument :description, types.String
#     resolve -> (obj, args, ctx) {
#       bakery = Bakery.new(:name => args[:name], :description => args[:description])
#       return bakery if bakery.save
#       return nil
#     }
#   end
# end

# module BakeryMutations
#   Create = GraphQL::ObjectType.define do
#     name "CreateBakeryMutation"
#     description "Create bakery and return new bakery"
#
#     input_field :name, types.String
#     # Define return parameters
#     return_field :bakery, BakeryType
#   end
# end

module BakeryMutation
  Create = GraphQL::Relay::Mutation.define do
    name "CreateBakeryMutation"
    description "Create bakery and return new bakery"

    input_field :name, types.String
    # Define return parameters
    return_field :bakery, BakeryType

    resolve ->(object, inputs, ctx) {
       bakery = Bakery.create!(:name => inputs[:name])
      #  bakery.account = Account.first
      #  bakery.user = User.first
       #bakery.save
       return {
         bakery: bakery
       }
    }
  end
end
