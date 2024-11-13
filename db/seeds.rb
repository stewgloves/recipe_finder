# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Seeding recipes..."
json = File.read(Rails.root.join('db/data/recipes-en.json'))
recipes_data = JSON.parse(json)
recipes_data.each do |recipe_data|
  recipe_data['image'] = RecipeImageHelper.parse_recipe_image(recipe_data['image'])
  next if recipe_data['image'].nil?

  Recipe.create(recipe_data)
end

puts "Seeded #{Recipe.count} recipes"
