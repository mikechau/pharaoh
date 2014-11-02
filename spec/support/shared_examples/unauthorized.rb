shared_examples "a unauthorized logged out user (CRUD)" do
  describe "for a logged out user" do
    context "all actions" do
      it "redirects to root path" do
        sign_in nil

        get :index
        expect(response).
          to redirect_to new_user_session_path

        get :show, id: '1'
        expect(response).
          to redirect_to new_user_session_path

        get :new
        expect(response).
          to redirect_to new_user_session_path

        post :create, attributes: {}
        expect(response).
          to redirect_to new_user_session_path

        get :edit, id: '1'
        expect(response).
          to redirect_to new_user_session_path

        patch :update, id: '1'
        expect(response).
          to redirect_to new_user_session_path

        delete :destroy, id: '1'
        expect(response).
          to redirect_to new_user_session_path
      end
    end
  end
end

shared_examples "a unauthorized signed in user (CRUD)" do
  describe "for a signed in user" do
    context "all actions" do
      it "redirects to root path" do
        get :index
        expect(response).to redirect_to root_path

        get :show, id: '1'
        expect(response).to redirect_to root_path

        get :new
        expect(response).to redirect_to root_path

        post :create, attributes: {}
        expect(response).to redirect_to root_path

        get :edit, id: '1'
        expect(response).to redirect_to root_path

        patch :update, id: '1'
        expect(response).to redirect_to root_path

        delete :destroy, id: '1'
        expect(response).to redirect_to root_path
      end
    end
  end
end