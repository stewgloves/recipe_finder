FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    cook_time { 10 }
    prep_time { 10 }
    ratings { rand(1..5) }
    category { '' }
    author { Faker::Name.name }
    image { '' }
    ingredients { { 'ingredient' => 'quantity' } }
  end
end
