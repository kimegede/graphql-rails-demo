class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, except: [:create, :show], fallback: :none
end
