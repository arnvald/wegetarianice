class UrlMappings {
    static mappings = {
    "/admin/article/$action?/$id?"(controller:"adminArticle")
    "/admin/articleCategory/$action?/$id?"(controller:"adminArticleCategory")
    "/admin/comment/$action?/$id?"(controller:"adminComment")
    "/admin/food/$action?/$id?"(controller:"adminFood")
    "/admin/foodCategory/$action?/$id?"(controller:"adminFoodCategory")
    "/admin/page/$action?/$id?"(controller:"adminPage")
    "/admin/recipe/$action?/$id?"(controller:"adminRecipe")
    "/admin/repiceCategory/$action?/$id?"(controller:"adminRecipeCategory")
    "/admin/unit/$action?/$id?"(controller:"adminUnit")
    "/admin/user/$action?/$id?"(controller:"adminUser")
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(view:"/index")
      "/test"(view:"/testlayout")
	  "500"(view:'/error')
	}
}
