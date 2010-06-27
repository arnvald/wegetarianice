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

    "/"(controller:"main", action:"index")
    "500"(view:'/error')
    "404"(view:'/pages/404')
	}
}
