class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_role

  private
    def check_admin_role
      raise CustomError::InsufficientAccess unless current_user.try(:is_admin?)
    end
end
