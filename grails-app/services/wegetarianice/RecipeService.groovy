package wegetarianice

class RecipeService {

  boolean transactional = true

  def serviceMethod() {

  }

  def static newest() {
    def recipes = Recipe.list(sort:"dateCreated", order:"Desc", max:10)
    return recipes
  }

  def static popular() {
    def recipes = Recipe.list(max:10)
    return recipes
  }

}
