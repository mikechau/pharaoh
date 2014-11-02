Spring.watch_method = :listen

Spring.watch "spec/factories/"
Spring.watch "spec/spec_helper"
Spring.watch "spec/rails_helper"
Spring.watch "spec/models/"
Spring.watch "spec/controllers/"
Spring.watch "spec/policies/"
Spring.watch "spec/routing/"
Spring.watch "spec/support/"
Spring.watch "lib/modules/"
Spring.watch "app/models/concerns/"
Spring.watch "app/controllers/concerns/"
Spring.watch "config/initializers/"

Spring.after_fork { FactoryGirl.reload }