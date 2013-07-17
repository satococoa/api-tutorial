# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    name { Forgery(:basic).text }
    title { Forgery(:basic).text }
    body { Forgery(:lorem_ipsum).words(10) }
  end
end
