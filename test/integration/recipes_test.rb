require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = Recipe.create(name: "vegetable saute", description: "greate vegie sautee, add onions and oil", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "chicken stir fry", description: "great chicken dish")
    @recipe2.save
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
