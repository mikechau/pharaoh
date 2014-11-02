require "rails_helper"

describe Admin::StaticPagesController, :type => :controller do

  describe "for a signed in admin user" do
    describe "GET index" do
      it "renders the template" do
        sign_in
        admin_sign_in

        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "for a signed in user" do
    describe "GET index" do
      it "redirects to root path" do
        sign_in build(:user)
        get :index
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "for a logged out user" do
    describe "GET index" do
      it "redirects to login" do
        sign_in nil
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end