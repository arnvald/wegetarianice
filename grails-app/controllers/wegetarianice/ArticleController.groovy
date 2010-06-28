package wegetarianice

class ArticleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def searchableService

    def index = {
        redirect(action: "list", params: params)
    }


    def search = {

    }

    def table = ["description","title"]

    def find = {
        def articleSet
        def listOfProperties = [];
        if(params.name)
            listOfProperties.add("title")
        if(params.body)
            listOfProperties.add("body")
        if(params.description)
            listOfProperties.add("description")
        if(params.similar)
            articleSet = Article.search("*"+params["query"]+"*",escape:false,properties:listOfProperties)
        else
            articleSet = Article.search(params["query"],escape:true,properties:listOfProperties)

        def total = articleSet.total
        def list  = articleSet.results
           
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [articleList:list,articleTotal:total]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [articleList: Article.list(params), articleTotal: Article.count()]
    }

    def create = {
        def article = new Article()
        article.properties = params
        return [article: article]
    }

    def save = {
        def article = new Article(params)
        if (article.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'article.label', default: 'Article'), article.id])}"
            redirect(action: "show", id: article.id)
        }
        else {
            render(view: "create", model: [article: article])
        }
    }

    def show = {
        def article = Article.get(params.id)
        if (!article) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
            redirect(action: "list")
        }
        else {
            [article: article]
        }
    }

    def edit = {
        def article = Article.get(params.id)
        if (!article) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [article: article]
        }
    }
    

    def update = {
        def article = Article.get(params.id)
        if (article) {
            if (params.version) {
                def version = params.version.toLong()
                if (article.version > version) {
                    
                    article.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'article.label', default: 'Article')] as Object[], "Another user has updated this Article while you were editing")
                    render(view: "edit", model: [article: article])
                    return
                }
            }
            article.properties = params
            if (!article.hasErrors() && article.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'article.label', default: 'Article'), article.id])}"
                redirect(action: "show", id: article.id)
            }
            else {
                render(view: "edit", model: [article: article])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def article = Article.get(params.id)
        if (article) {
            try {
                article.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), params.id])}"
            redirect(action: "list")
        }
    }
}
