class ApplicationController < ActionController::Base
  include CustomError
  include Pundit

  rescue_from CustomError::InsufficientAccess, with: -> { user_not_authorized('Insufficient Access') }
  rescue_from Pundit::NotAuthorizedError, with: -> { user_not_authorized('Insufficient Privileges') }

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def append_info_to_payload(payload)
    super
    payload[:user_id] = current_user_id
    payload[:user_name] = current_user_name
    payload[:user_agent] = request_user_agent
  end

  private
    def user_not_authorized(message)
      if Rails.env.development?
        redirect_to root_path, :alert => message
      else
        redirect_to root_path
      end
    end

    def current_user_id
      current_user.try(:id) || 'none'
    end

    def current_user_name
      current_user.try(:name) || 'Guest'
    end

    def request_user_agent
      request.headers['HTTP_USER_AGENT'] || 'Unknown'
    end
end
