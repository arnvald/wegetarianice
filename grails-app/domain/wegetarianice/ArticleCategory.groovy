package wegetarianice

class ArticleCategory {

  String name
  String description

  static hasMany = [articles:Article]
  static constraints = {
    name(blank: false, unique: true)
    description(nullable: true)
  }

  String toString() {"$name"}
}
