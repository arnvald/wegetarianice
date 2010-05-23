package wegetarianice

class Recipe {

  String body
  String name
  String description

  static hasMany = [ingredients:Ingredient]
  static belongsTo = [user:User, category:RecipeCategory]
  static constraints = {
    body(blank: false)
    name(unique: true, blank: false)
    description(nullable: true)
  }  
}
