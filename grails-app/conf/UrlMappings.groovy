class UrlMappings {
    static mappings = {
    "/szukaj/$action/$id"(controller:"searchable")

    /* === articles === */
    "/artykuly"(controller:"article", action:"list")
    "/artykuly/nowy"(controller:"article", action:"create")
    "/artykuly/utworz/$id"(controller:"article", action:"save")
    "/artykuly/edytuj/$id"(controller:"article", action:"edit")
    "/artykuly/zaktualizuj/$id"(controller:"article", action:"update")
    "/artykuly/$id"(controller: "article", action:"show")
    "/artykuly/usun/$id"(controller: "article", action:"destroy")
    "/artykuly/szukaj" (controller: "article", action:"find")

    /* === recipes === */
    "/przepisy"(controller:"recipe", action:"list")
    "/przepisy/nowy"(controller:"recipe", action:"create")
    "/przepisy/utworz"(controller:"recipe", action:"save")
    "/przepisy/edytuj/$id"(controller:"recipe", action:"edit")
    "/przepisy/zaktualizuj"(controller:"recipe", action:"update")
    "/przepisy/$id"(controller: "recipe", action:"show")
    "/przepisy/usun/$id"(controller: "recipe", action:"destroy")
    "/przepisy/szukaj" (controller: "recipe", action:"find")
    /* === recipeCategories=== */
    "/kategorie"(controller:"recipeCategory", action:"list")
    "/kategorie/nowa"(controller:"recipeCategory", action:"create")
    "/kategorie/utworz/$id"(controller:"recipeCategory", action:"save")
    "/kategorie/edytuj/$id"(controller:"recipeCategory", action:"edit")
    "/kategorie/zaktualizuj/$id"(controller:"recipeCategory", action:"update")
    "/kategorie/$id"(controller: "recipeCategory", action:"show")
    "/kategorie/usun/$id"(controller: "recipeCategory", action:"destroy")

    /* === users === */
    "/uzytkownicy"(controller:"user", action:"list")
    "/uzytkownicy/utworz/$id"(controller:"user", action:"save")
    "/uzytkownicy/edytuj/$id"(controller:"user", action:"edit")
    "/uzytkownicy/zaktualizuj/$id"(controller:"user", action:"update")
    "/uzytkownicy/$id"(controller: "user", action:"show")
    "/uzytkownicy/usun/$id"(controller: "user", action:"destroy")

    /* === articleCategories === */
    "/artykuly/kategorie"(controller:"articleCategory", action:"list")
    "/artykuly/kategorie/nowa"(controller:"articleCategory", action:"create")

    "/artykuly/kategorie/utworz"(controller:"articleCategory", action:"save")
    "/artykuly/kategorie/edytuj/$id"(controller:"articleCategory", action:"edit")
    "/artykuly/kategorie/zaktualizuj/$id"(controller:"articleCategory", action:"update")
    "/artykuly/kategorie/$id"(controller: "articleCategory", action:"show")
    "/artykuly/kategorie/usun/$id"(controller: "articleCategory", action:"destroy")

    "/wyloguj"(controller:"logout")
    "/zaloguj"(controller:"login", action:"auth")
    "/rejestracja"(controller:"register")
    "/rejestracja/zakoncz"(controller:"register",action:"save")
    "/szukaj"(controller:"searchable", action:"index")
    "/strony/$action?/$id?"(controller:"page")
    "/kontakt"(view:"/pages/contact")

    "/"(controller:"main", action:"index")
    "/captcha"(controller:"captcha", action:"index")
    "500"(view:'/error')
    "404"(view:'/pages/404')
	}
}
