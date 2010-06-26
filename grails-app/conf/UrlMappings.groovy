class UrlMappings {
    static mappings = {
    "/szukaj/$action/$id"(controller:"searchable")
    "/artykuly/$action?/$id?"(controller:"article")
    "/przepisy/$action?/$id?"(controller:"recipe")
    "/kategorie/$action?/$id?"(controller:"categories")
    "/wyloguj/$action?/$id?"(controller:"logout")
    "/zaloguj/$action?/$id?"(controller:"login")
    "/rejestracja/$action?/$id?"(controller:"register")
    "/uzytkownicy/$action?/$id?"(controller:"user")
    "/strony/$action?/$id?"(controller:"page")
    "/kontakt"(view:"/pages/contact")
    
    //admin section
    "/admin/artykuly/$action?/$id?"(controller:"adminArticle")
    "/admin/kategorieArtykulow/$action?/$id?"(controller:"adminArticleCategory")
    "/admin/komentarze/$action?/$id?"(controller:"adminComment")
    "/admin/skladniki/$action?/$id?"(controller:"adminFood")
    "/admin/kategorieSkladnikow/$action?/$id?"(controller:"adminFoodCategory")
    "/admin/strony/$action?/$id?"(controller:"adminPage")
    "/admin/przepisy/$action?/$id?"(controller:"adminRecipe")
    "/admin/kategoriePrzepisow/$action?/$id?"(controller:"adminRecipeCategory")
    "/admin/jednostki/$action?/$id?"(controller:"adminUnit")
    "/admin/uzytkownicy/$action?/$id?"(controller:"adminUser")

    "/"(controller:"main", action:"index")
    "500"(view:'/error')
    "404"(view:'/pages/404')
	}
}
