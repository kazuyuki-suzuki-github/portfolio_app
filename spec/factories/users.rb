FactoryBot.define do
  factory :user do
    id {1}
    name {"Test Taro"}
    email {"sample@test.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
