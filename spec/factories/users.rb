FactoryBot.define do
  factory :user do
    name { 'MyString' }
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { 'password' }
  end
end
