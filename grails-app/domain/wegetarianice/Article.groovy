package wegetarianice

class Article {

  String title
  String description
  String body
  Date dateCreated
  Date lastUpdated

  static belongsTo = [user:User, category:ArticleCategory]

  static constraints = {
    title(blank: false, unique: true)
    description(nullable: true)
    body(blank: false)
    lastUpdated(nullable: true)
  }
}
