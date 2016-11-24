class ApiController < ApplicationController
  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    result = BakerySchema.execute(
      query_string,
      variables: query_variables,
      # Add the current_user into the query context
      context: {
        current_user: current_user
      },
    )
    render json: result
  end
end
