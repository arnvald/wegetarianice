package wegetarianice.admin

class AdminArticleController extends AdminController {

    def index = { }

  def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [articleInstanceList: Article.list(params), articleInstanceTotal: Article.count()]
    }
}
