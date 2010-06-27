package wegetarianice

class ArticleCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [articleCategoryInstanceList: ArticleCategory.list(params), articleCategoryInstanceTotal: ArticleCategory.count()]
    }

    def create = {
        def articleCategoryInstance = new ArticleCategory()
        articleCategoryInstance.properties = params
        return [articleCategoryInstance: articleCategoryInstance]
    }

    def save = {
        def articleCategoryInstance = new ArticleCategory(params)
        if (articleCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), articleCategoryInstance.id])}"
            redirect(action: "show", id: articleCategoryInstance.id)
        }
        else {
            render(view: "create", model: [articleCategoryInstance: articleCategoryInstance])
        }
    }

    def show = {
        def articleCategoryInstance = ArticleCategory.get(params.id)
        if (!articleCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [articleCategoryInstance: articleCategoryInstance]
        }
    }

    def edit = {
        def articleCategoryInstance = ArticleCategory.get(params.id)
        if (!articleCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [articleCategoryInstance: articleCategoryInstance]
        }
    }

    def update = {
        def articleCategoryInstance = ArticleCategory.get(params.id)
        if (articleCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (articleCategoryInstance.version > version) {
                    
                    articleCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'articleCategory.label', default: 'ArticleCategory')] as Object[], "Another user has updated this ArticleCategory while you were editing")
                    render(view: "edit", model: [articleCategoryInstance: articleCategoryInstance])
                    return
                }
            }
            articleCategoryInstance.properties = params
            if (!articleCategoryInstance.hasErrors() && articleCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), articleCategoryInstance.id])}"
                redirect(action: "show", id: articleCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [articleCategoryInstance: articleCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def articleCategoryInstance = ArticleCategory.get(params.id)
        if (articleCategoryInstance) {
            try {
                articleCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'articleCategory.label', default: 'ArticleCategory'), params.id])}"
            redirect(action: "list")
        }
    }
}
