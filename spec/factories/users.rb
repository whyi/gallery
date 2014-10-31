# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test_user_model@whyi.net"
    password "testPassword"
    password_confirmation "testPassword"
  end
end
