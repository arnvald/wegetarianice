package wegetarianice

class RecipeController {

  def searchableService

  def index = {
    redirect(action: "list", params: params)
  }

  def search = {

  }

  def table = ["description","title"]

    def find = {
        
        def list
        def recipeSet


        if(params.radioRecipeSearch != '2') {
            recipeSet = Recipe.search(params["searchByContent"],escape:true,operator:"OR")
            list  = recipeSet.results
            list.each ({ item -> item.user =  Recipe.get(item.id).user  })
            [recipeInstanceList:list]
        }
        else {
           String a =   (params["searchByIngridient"])
           def lst =  a.split(",")
           def foodList = Food.findAll("from Food as b where b.name in (:foods)", [foods:lst] )
           def ingredientList = Ingredient.findAll("from Ingredient as b where b.food in (:foods)", [foods:foodList] )
           def resultMap = [:]
           def c = 0
            ingredientList.each({
                
              if(resultMap.get(it.recipe) == null) {
               resultMap.put(it.recipe,it.priority)
              }
              else {
               resultMap[it.recipe] =  resultMap[it.recipe] + it.priority
              }   
                    
            })
           resultMap.sort {it.value}
           

           def resultList = []
           resultMap.each({resultList.add(it.key)})
           def revResult = []
           for(int i = resultList.size(); i>0; i--) {
               revResult.add(resultList.get(i-1))
           }

               [recipeInstanceList:revResult]
        }
    }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [recipeList: Recipe.list(params), recipeTotal: Recipe.count()]
  }

  def create = {
    def recipe = new Recipe()
    recipe.properties = params
    return [recipe: recipe]
  }

  def save = {
    def recipe = new Recipe(params)
    recipe.slug = recipe.name.toLowerCase().replaceAll(" ", "-").replaceAll(/[^\sA-Za-z-0-9]/, "")
    if (recipe.save(flush: true)) {
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'recipe.label', default: 'Recipe'), recipe.id])}"
        redirect(action: "show", id: recipe.id)
    }
    else {
        render(view: "create", model: [recipe: recipe])
    }
  }

  def show = {
    def recipe = Recipe.findBySlug(params.id)
    if (!recipe) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
    else {
      [recipe: recipe]
    }
  }

  def edit = {
    def recipe = Recipe.findBySlug(params.id)
    if (!recipe) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [recipe: recipe]
    }
  }

  def update = {
    def recipe = Recipe.findBySlug(params.id)
    if (recipe) {
      if (params.version) {
        def version = params.version.toLong()
        if (recipe.version > version) {

          recipe.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'recipe.label', default: 'Recipe')] as Object[], "Another user has updated this Recipe while you were editing")
          render(view: "edit", model: [recipe: recipe])
          return
        }
      }
      recipe.properties = params
      if (!recipe.hasErrors() && recipe.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'recipe.label', default: 'Recipe'), recipe.id])}"
        redirect(action: "show", id: recipe.id)
      }
      else {
        render(view: "edit", model: [recipe: recipe])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def recipe = Recipe.findBySlug(params.id)
    if (recipe) {
      try {
        recipe.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
  }

}