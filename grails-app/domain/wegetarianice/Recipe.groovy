package wegetarianice

class Recipe {

  static searchable = true

  String body
  String name
  String description
  String slug
  Date dateCreated
  Date lastUpdated

  static hasMany = [ingredients:Ingredient]
  static belongsTo = [user:User, category:RecipeCategory]
  static constraints = {
    body(blank: false)
    name(unique: true, blank: false)
    description(nullable: true)
    slug(nullable:true)
  }

  def getSimilar() {
    def set= Recipe.search(name,escape:true,operator:"or",properties:["name"])
    def list = set.results
    def result = []
    list.each({
      if(it.id != this.id)
      result.add(Recipe.get(it.id))
     })
     return result
  }
}
