package wegetarianice

class Article {

    String title
    String description
    String body
    Date dateCreated
    Date lastUpdated
   
    static belongsTo = [user:User, category:ArticleCategory]

    static constraints = {
    }
}
