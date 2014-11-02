require "rails_helper"

describe "routes to the admin static pages", :type => :routing do
  it "routes admin static index" do
    expect(get: admin_root_path).
      to route_to(controller: "admin/static_pages", action: "index")
  end
end