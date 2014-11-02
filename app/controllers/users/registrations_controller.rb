class Users::RegistrationsController < Devise::RegistrationsController
  layout 'guest/application', only: [:new, :create]

  # def new
  #   super
  # end

  # def create
  #   super
  # end

  # def edit
  #   super
  # end

  # def update
  #   super
  # end

  # def cancel
  #   super
  # end

  # def destroy
  #   super
  # end
end
