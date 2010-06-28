package wegetarianice

class RecipeCategoryController {

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [recipeCategoryList: RecipeCategory.list(params), recipeCategoryTotal: RecipeCategory.count()]
  }

  def create = {
    def recipeCategory = new RecipeCategory()
    recipeCategory.properties = params
    return [recipeCategory: recipeCategory]
  }

  def save = {
    def recipeCategory = new RecipeCategory(params)
    recipeCategory.slug = recipeCategory.name.toLowerCase().replaceAll(" ", "-").replaceAll(/[^\sA-Za-z-0-9]/, "")
    if (recipeCategory.save(flush: true)) {
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), recipeCategory.id])}"
        redirect(action: "show", id: recipeCategory.id)
    }
    else {
        render(view: "create", model: [recipeCategory: recipeCategory])
    }
  }

  def show = {
    def recipeCategory = RecipeCategory.findBySlug(params.id)
    if (!recipeCategory) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
      redirect(action: "list")
    }
    else {
      [recipeCategory: recipeCategory]
    }
  }

  def edit = {
    def recipeCategory = RecipeCategory.findBySlug(params.id)
    if (!recipeCategory) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [recipeCategory: recipeCategory]
    }
  }

  def update = {
    def recipeCategory = RecipeCategory.findBySlug(params.id)
    if (recipeCategory) {
      if (params.version) {
        def version = params.version.toLong()
        if (recipeCategory.version > version) {

          recipeCategory.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'recipeCategory.label', default: 'RecipeCategory')] as Object[], "Another user has updated this RecipeCategory while you were editing")
          render(view: "edit", model: [recipeCategory: recipeCategory])
          return
        }
      }
      recipeCategory.properties = params
      if (!recipeCategory.hasErrors() && recipeCategory.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), recipeCategory.id])}"
        redirect(action: "show", id: recipeCategory.id)
      }
      else {
        render(view: "edit", model: [recipeCategory: recipeCategory])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def recipeCategory = RecipeCategory.findBySlug(params.id)
    if (recipeCategory) {
      try {
        recipeCategory.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipeCategory.label', default: 'RecipeCategory'), params.id])}"
      redirect(action: "list")
    }
  }

}