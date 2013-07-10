# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { Forgery(:basic).text(at_least: 3, at_most: 100) }
    name { Forgery(:basic).text(at_least: 3, at_most: 100) }
    body { Forgery(:lorem_ipsum).words(10) }
  end
end
