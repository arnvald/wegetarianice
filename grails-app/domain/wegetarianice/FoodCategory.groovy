package wegetarianice

class FoodCategory {

  String name
  String description

  static hasMany = [food:Food]

  static constraints = {
    name(blank: false, unique: true)
    description(nullable: true)
  }
}
