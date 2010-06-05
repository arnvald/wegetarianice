package wegetarianice

class Food {
  String name

  static hasMany = [ingredients:Ingredient]
  static belongsTo = [unit:Unit,food:FoodCategory]

  static constraints = {
    name(blank: false, unique: true)
  }
}
