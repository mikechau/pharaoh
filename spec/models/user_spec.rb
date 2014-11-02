require "rails_helper"

describe User, :type => :model do

  let(:user) { create(:user) }
  let(:invalid_user) { build(:user, name: nil) }
  let(:valid_user) { build(:user) }

  context "when user is invalid" do
    it "is invalid" do
      expect(invalid_user.invalid?).to be_truthy
    end

    it "has error messages" do
      invalid_user.valid?
      expect(invalid_user.errors[:name].any?).to be_truthy
      expect(invalid_user.errors.messages.any?).to be_truthy
    end
  end

  context "when a user is valid" do
    it "is valid" do
      expect(valid_user.valid?).to be_truthy
    end

    it "shows the name" do
      expect(valid_user.name).
        to eq("#{user.first_name} #{user.last_name}")
    end

    it "assigns a default user role" do
      expect(user.has_role? :user).to be_truthy
    end

    it "downcases the email" do
      new_user = User.new({email: "UPCASE@EMAIL.COM"})
      expect(new_user.email).to eq('upcase@email.com')
    end

    it "can assign an admin role" do
      user.add_role :admin
      user.save! && user.reload

      expect(user.has_role? :admin).to be_truthy
    end
  end

end
