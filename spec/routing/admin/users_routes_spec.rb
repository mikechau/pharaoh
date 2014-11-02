require "rails_helper"

describe "routes to the admin users controller", :type => :routing do
  it "routes index" do
    expect(get: admin_users_path).
      to route_to(controller: "admin/users", action: "index")
  end

  it "routes a show" do
    expect(get: admin_user_path(1)).
      to route_to(controller: "admin/users", action: "show", id: "1")
  end

  it "routes a new" do
    expect(get: new_admin_user_path).
      to route_to(controller: "admin/users", action: "new")
  end

  it "routes a create" do
    expect(post: admin_users_path).
      to route_to(controller: "admin/users", action: "create")
  end

  it "routes a edit" do
    expect(get: edit_admin_user_path(1)).
      to route_to(controller: "admin/users", action: "edit", id: "1")
  end

  it "routes a update" do
    expect(patch: admin_user_path(1)).
      to route_to(controller: "admin/users", action: "update", id: "1")
  end

  it "routes a delete" do
    expect(delete: admin_user_path(1)).
      to route_to(controller: "admin/users", action: "destroy", id: "1")
  end

  it "routes a page" do
    expect(get: admin_users_path(page: 2)).
      to route_to(controller: "admin/users", action: "index", page: "2")
  end

  it "routes enable user" do
    expect(post: enable_admin_users_path(id: 1)).
      to route_to(controller: "admin/users", action: "enable", id: "1")
  end

end