require "rails_helper"

describe StaticPagesController, :type => :controller do
  describe "GET static pages" do
    context "index" do
      it "renders the template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end