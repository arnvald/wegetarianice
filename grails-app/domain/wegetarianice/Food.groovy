package wegetarianice

class Food {
  String name

  static hasMany = [ingredients:Ingredient]
  static belongsTo = [unit:Unit]

  static constraints = {
    name(blank: false, unique: true)
  }
}
