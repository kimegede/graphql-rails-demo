class ApiController < ApplicationController
  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']
    return authentication_error unless auth_token
    authenticate_with_auth_token auth_token
  end

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    result = BakerySchema.execute(
      query_string,
      variables: query_variables,
      context: {current_user: current_user}, # Add the current_user into the query context
    )
    render json: result
  end

  def authenticate_with_auth_token(auth_token)
    # return if the token does not have the right format
    return authentication_error unless auth_token.include?(':')

    # Find the user by splitting the token and finding by id
    # Again, not the most secure way to do it, but works as an example.
    user_id = auth_token.split(':').first
    user = User.where(id: user_id).first

    # Use secure_compare to mitigate timing atttacks
    if user && Devise.secure_compare(user.access_token, auth_token)
      sign_in user, store: false
    else
      authentication_error
    end
  end
end
