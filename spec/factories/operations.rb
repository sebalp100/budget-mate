FactoryBot.define do
  factory :operation do
    name { 'MyString' }
    amount { '9.99' }
    category { '💳' }
    user
  end
end
