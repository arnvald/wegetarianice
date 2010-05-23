package wegetarianice

class Comment {

    String body

    static belongsTo = [user:User, article:Article]

    static constraints = {
      body(blank: false)
    }
}
