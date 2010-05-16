package wegetarianice

class User {

  String login
  String password
  

  static hasMany = [articles:Article, dishes:Dish]

    static constraints = {
    }
}
