## Food Finder

Food Finder is a web application that allows users to search for recipes based on available ingredients and save their favorite recipes.

## Problem statement
Create an application that helps users find the most relevant recipes that they can prepare with the ingredients that they have at home

## Features
Recipe Search: Input ingredients to discover matching recipes.\
Ingredient quick view: View recipe ingredients with ease\
Favorites Management: Save and delete favorite recipes.\
User Authentication: Secure sign-up and login functionalities.


## Getting Started

Prerequisites\
Ruby 3.0.0 or higher\
Rails 7.1 or higher\
PostgreSQL

## Installation
Clone the repository
```
$ git clone
$ cd recipe_finder
```
Install required gems
```
$ bundle install
```

Create, migrate and seed the database with recipes from all-recipes
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
Start the server
```
$ rails s
```

Open your browser and navigate to http://localhost:3000/

## Testing
Run the test suite with RSpec
```
$ rspec
```

# User Stories
As a user, I want to be able to search for recipes based on the ingredients that I have at home\
As a user, I want to be able to save my favorite recipes to reference later\
As a user, I want to be able to view the ingredients for a recipe with ease

## Future features
- Add `Notes` to recipes to allow users to add their own notes to recipes
- Add `Show` pages for `Recipes` and `Favourties` to provide easier access to your favourites list
- Add `Search by Category` feature to further improve relevancy
- Improve performance of pg_search with additional ts_vector columns
- Add `User Profile` page to manage user information