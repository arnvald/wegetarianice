package wegetarianice

class Ingredient {

  static searchable = true;

  //Food food
  //Recipe recipe
  int priority
  int quantity

  static belongsTo = [food:Food,recipe:Recipe]

  static constraints = {
    priority(blank: false)
    quantity(nullable: true)
  }
}
