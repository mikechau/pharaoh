class Users::SessionsController < Devise::SessionsController
  layout 'guest/application', only: [:new, :create]
  # def new
  #   super
  # end

  # def create
  #   super
  # end

  # def destroy
  #   super
  # end
end
