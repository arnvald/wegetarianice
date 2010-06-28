package wegetarianice

class RecipeCategory {

  String name
  String description
  String slug

  static hasMany = [recipes:Recipe]
  static constraints = {
    name(blank: false, unique: true)
    description(nullable: true)
    slug(nullable:false)
  }

  String toString() {"$name"}
}
