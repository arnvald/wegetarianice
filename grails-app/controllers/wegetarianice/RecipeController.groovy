package wegetarianice

class RecipeController {

  def beforeInterceptor = [action:this.&setSlug,only:['save']]
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

           resultMap.each({println "${it.key} ${it.value}"  })
          
           redirect (action : "list")
        }

        
    }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [recipeInstanceList: Recipe.list(params), recipeInstanceTotal: Recipe.count()]
  }

  def create = {
    def recipeInstance = new Recipe()
    recipeInstance.properties = params
    return [recipeInstance: recipeInstance]
  }

  def save = {
    def recipeInstance = new Recipe(params)
    if (recipeInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'recipe.label', default: 'Recipe'), recipeInstance.id])}"
        redirect(action: "show", id: recipeInstance.id)
    }
    else {
        render(view: "create", model: [recipeInstance: recipeInstance])
    }
  }

  def show = {
    def recipeInstance = Recipe.findBySlug(params.id)
    if (!recipeInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
    else {
      [recipeInstance: recipeInstance]
    }
  }

  def edit = {
    def recipeInstance = Recipe.findBySlug(params.id)
    if (!recipeInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [recipeInstance: recipeInstance]
    }
  }

  def update = {
    def recipeInstance = Recipe.findBySlug(params.id)
    if (recipeInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (recipeInstance.version > version) {

          recipeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'recipe.label', default: 'Recipe')] as Object[], "Another user has updated this Recipe while you were editing")
          render(view: "edit", model: [recipeInstance: recipeInstance])
          return
        }
      }
      recipeInstance.properties = params
      if (!recipeInstance.hasErrors() && recipeInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'recipe.label', default: 'Recipe'), recipeInstance.id])}"
        redirect(action: "show", id: recipeInstance.id)
      }
      else {
        render(view: "edit", model: [recipeInstance: recipeInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipe.label', default: 'Recipe'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def recipeInstance = Recipe.findBySlug(params.id)
    if (recipeInstance) {
      try {
        recipeInstance.delete(flush: true)
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