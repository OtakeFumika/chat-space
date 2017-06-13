FactoryGirl.define do
  factory :user do
    name                  "takashi"
    email                 {Faker::Internet.email}
    password              "password"
    password_confirmation "password"
  end
end
