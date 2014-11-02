# Rolify.configure do |config|
  # By default ORM adapter is ActiveRecord. uncomment to use mongoid
  # config.use_mongoid

  # Dynamic shortcuts for User class (user.is_admin? like methods). Default is: false
  # Enable this feature _after_ running rake db:migrate as it relies on the roles table
  # config.use_dynamic_shortcuts
# end

# Monkey patch for Rails 4.1
# See issue: https://github.com/EppO/rolify/issues/168
# module Rolify::Configure
#   def role_table_missing?(role_class)
#     !role_class.table_exists?
#   end
# end