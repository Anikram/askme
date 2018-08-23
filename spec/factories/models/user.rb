FactoryBot.define do
  factory :user do
    name { "John" }
    username  { "Jhonson" }
    sequence(:email) { |n| "example_user_#{n}@mail.com"}
    password { '12345' }
    password_hash { '12345' }
    password_salt { '12345' }
  end
end