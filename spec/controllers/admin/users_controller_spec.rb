# require "rails_helper"

# describe Admin::UsersController, :type => :controller do

#   let!(:user) { create(:user) }
#   let(:admin) { create(:admin) }

#   describe "for a signed in admin user" do
#     before(:each) do
#       sign_in(admin)
#       admin_sign_in
#     end

#     describe "GET index" do
#       before(:each) { get :index }

#       it "populates the array of users" do
#         expect(assigns(:users)).to eq([user, admin])
#       end

#       it "renders the template" do
#         expect(response).to render_template :index
#       end
#     end

#     describe "GET show" do
#       before(:each) { get :show, id: user }

#       it "assigns user" do
#         expect(assigns(:user)).to eq(user)
#       end

#       it "renders the template" do
#         expect(response).to render_template :show
#       end
#     end

#     describe "GET new" do
#       before(:each) { get :new }

#       it "assigns a new user" do
#         user = User.new
#         expect(assigns(:user).to_json).to eq(user.to_json)
#       end

#       it "renders the template" do
#         expect(response).to render_template :new
#       end
#     end

#     describe "POST create" do
#       context "with valid attributes" do
#         it "saves the new user" do
#           expect {
#             post :create,
#             user: attributes_for(:user_new)
#           }.to change(User, :count).by(1)
#         end

#         it "redirects to index" do
#           post :create, user: attributes_for(:user_new)
#           expect(response).to redirect_to admin_users_path
#         end
#       end

#       context "with invalid attributes" do
#         it "does not save the new user" do
#           expect {
#             post :create,
#             user: { invalid: true }
#           }.to_not change(User, :count)
#         end

#         it "rerenders the new view" do
#           post :create, user: { invalid: true }
#           expect(response).to render_template :new
#         end
#       end
#     end

#     describe "PATCH update" do
#       context "with valid attributes" do
#         it "locates the user" do
#           patch :update, id: user,
#             user: attributes_for(:user)
#           expect(assigns(:user)).to eq(user)
#         end

#         it "changes the user attributes" do
#           patch :update, id: user,
#             user: attributes_for(:user, name: 'Test Works')
#           user.reload
#           expect(user.first_name).to eq('Test')
#           expect(user.last_name).to eq('Works')
#         end

#         it "redirects to index" do
#           patch :update, id: user,
#             user: attributes_for(:user)
#           expect(response).to redirect_to admin_users_path
#         end
#       end

#       context "with invalid attributes" do
#         it "rerenders the edit view" do
#           patch :update, id: user,
#             user: { password: 'x', password_confirmation: 'y' }
#           expect(response).to render_template :edit
#         end
#       end
#     end

#     describe "DELETE destroy" do
#       it "disables the user" do
#         expect {
#           delete :destroy, id: user
#         }.to change(User, :count).by(-1)
#       end

#       it "redirects to index" do
#         delete :destroy, id: user
#         expect(response).to redirect_to admin_users_path
#       end
#     end
#   end

#   it_behaves_like "a unauthorized signed in user (CRUD)" do
#     before(:each) { sign_in user }
#   end

#   it_behaves_like "a unauthorized logged out user (CRUD)"
# end