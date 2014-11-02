module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).
        and_throw(:warden, {:scope => :user})

      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).
        and_return(user)

      allow(controller).to receive(:current_user).and_return(user)
    end
  end

  def admin_sign_in
    allow(controller).to receive(:check_admin_role).and_return(true)
    allow(controller).to receive(:authorize).and_return(true)
  end
end

module Devise
  module Models
    module DatabaseAuthenticatable

      def valid_password?(password)
        return false if encrypted_password.blank?
 
        encrypted_password == password_digest(password)
      end

      protected
        def password_digest(password)
          password
        end
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerHelpers, :type => :controller
end