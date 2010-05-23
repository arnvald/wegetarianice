package wegetarianice

class RecipeCategory {

  String name
  String description

  static hasMany = [recipes:Recipe]
  static constraints = {
    name(blank: false)
    description(nullable: true)
  }
}
