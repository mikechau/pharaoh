shared_examples "a admin only permission policy" do
  let(:admin_user) {
    user = User.new
    user.add_role :admin
    user
  }

  let(:user) {
    User.new
  }

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "grants access to admins" do
      expect(subject).to permit(admin_user, User)
    end

    it "denies access to non admins" do
      expect(subject).not_to permit(user, User)
    end

    it "denies access to logged out users" do
      expect { subject permit(nil, User) }.to raise_error
    end
  end
end

shared_examples_for "admin only permission policy" do |controller_actions|
  let(:admin_user) {
    user = User.new
    user.add_role :admin
    user
  }

  let(:user) {
    User.new
  }

  controller_actions.each do |action|
    permissions action do
      it "grants access to admins" do
        expect(subject).to permit(admin_user, User)
      end

      it "denies access to non admins" do
        expect(subject).not_to permit(user, User)
      end

      it "denies access to logged out users" do
        expect { subject permit(nil, User) }.to raise_error
      end
    end
  end
end