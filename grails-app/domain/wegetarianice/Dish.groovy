    package wegetarianice

class Dish {
    static hasMany = [ingredients:Ingredient]
    static belongsTo = [users:User]

    static constraints = {
    }
}
