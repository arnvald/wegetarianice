package wegetarianice

class Article {

  static searchable = true

  String title
  String description
  String body
  String slug
  Date dateCreated
  Date lastUpdated
  static hasMany =[comments:Comment]
  static belongsTo = [user:User, category:ArticleCategory]

  static constraints = {
    title(blank: false, unique: true)
    description(nullable: true)
    body(blank: false)
    lastUpdated(nullable: true)
    slug(nullable: true)
  }

  boolean isOwnedBy(User user) {
    return true
  }
}
