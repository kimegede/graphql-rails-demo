class FetchField < GraphQL::Field
  def initialize(model:, type:)
    Rails.logger.info("Query begin: #{Time.now.to_i}")
    self.type = type
    @model = model
    self.description = "Find a #{model.name} by ID"
    self.arguments = {
      "id" => GraphQL::Argument.define do
        name "id"
        type !GraphQL::INT_TYPE
        description "Id for record"
      end
    }
  end

  def resolve(object, arguments, ctx)
    @model.find(arguments["id"])
  end
end
