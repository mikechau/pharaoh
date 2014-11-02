FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now

    factory :admin do
      email 'admin@admin.com'
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :user_new do
      email 'new@ex.com'
    end
  end
end
