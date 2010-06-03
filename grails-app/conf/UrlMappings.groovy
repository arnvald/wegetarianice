class UrlMappings {
    static mappings = {
    "/admin/user/$action?/$id?"(controller:"adminUser")
    "/admin/page/$action?/$id?"(controller:"adminPage")
    "/admin/recipe/$action?/$id?"(controller:"adminRecipe")
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(view:"/index")
	  "500"(view:'/error')
	}
}
