package wegetarianice

class User {

  String login
  String password
  String email
  String realName
  String website
  Date dateCreated
    Date lastUpdated

  static hasMany = [articles:Article, recipes:Recipe, comments:Comment]

  static constraints = {
    login(blank: false, unique: true, minLength: 4, maxLength: 32)
    password(blank: false, minLength: 6, maxLength: 64)
    email(email: true, blank: false)
    website(url: true, nullable: true)
    realName(nullable: true)
    lastUpdated(nullable: true)
  }


}
