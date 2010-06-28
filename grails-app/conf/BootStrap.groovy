import wegetarianice.*
class BootStrap {




     def init = { servletContext ->
        //obydwa hasla to test1234

        def role = new Role(authority: 'ROLE_ADMIN', description: 'Admin role')
        def role2 = new Role(authority: 'ROLE_USER', description: 'User role')
        def admin = new User(username:"pejot",userRealName:"Filip",passwd:"9bc34549d565d9505b287de0cd20ac77be1d3f2c",email:"gowno@o2.pl",enabled:"true")
        def user = new User(username:"arnvald",userRealName:"Grzes",passwd:"9bc34549d565d9505b287de0cd20ac77be1d3f2c",email:"gowno@o2.pl",enabled:"true")


        admin.addToAuthorities(role)
        admin.addToAuthorities(role2)
        user.addToAuthorities(role2)

        role.save()
        role2.save()
  //     admin.save()
   //    user.save()

        def articleA = new Article (title:"tytul artykulu1", description:"opis artyuku", body:"cialo artkulu")
        def articleB = new Article (title:"tytul artykulu2", description:"opis artyuku", body:"cialo artkulu")
        def articleC = new Article (title:"tytul artykulu3", description:"opis artyuku", body:"cialo artkulu")

        def categoryA = new ArticleCategory(name:"Filozofia",description:"artykuly o filozofi odrzywiania").save()
        def categoryB = new ArticleCategory(name:"Zdrowie",description:"artykuly o zdrowym odzywianiu i wpływie rezygnacji z jedzenia mięsa na zdrowie").save()
        def categoryC = new ArticleCategory(name:"Informacje",description:"relacje z przeróżnych eventów o tematyce wegetariajńskiej").save()


        user.addToArticles(articleA)
        user.addToArticles(articleB)
        admin.addToArticles(articleC)
        categoryA.addToArticles(articleA)
        categoryB.addToArticles(articleB)
        categoryC.addToArticles(articleC)

        //articleA.save()
        articleB.save()
        articleC.save()

        def commentA = new Comment(body:"Twoja stara pierze w rzece")
        articleA.addToComments(commentA)
        user.addToComments(commentA)

     
        def foodCategoryA = new FoodCategory(name:"owoce",description:"pusta")      
        def unitA = new Unit(name:"sztuka").save()
        def foodA = new Food(name:"Jabko")
        def foodB = new Food(name:"banan")

        foodA.unit=unitA
        foodB.unit=unitA
        foodCategoryA.addToFood(foodA).save()
        foodCategoryA.addToFood(foodB).save()
        foodA.save()
        foodB.save()
//
//
//
        def recipeCategoryA = new RecipeCategory(name:"Sniadnia",description:"sniadaniowe").save()
        def recipeCategoryB = new RecipeCategory(name:"Obiady",description:"obiadowe").save()
        def recipe1 = new Recipe(body:"wez tamot wrzuc tu potem sie wal na ryj",name:"kotlet z dupy",description:"smakowe")
        def recipe2 = new Recipe(body:"wez tamot wrzuc tu xxpotem sie wal na ryj",name:"daaanie",description:"smakowe")
        def ingredient = new Ingredient(priority:5, quantity:5)
        def ingredient2 = new Ingredient(priority:4, quantity:5)
        user.addToRecipes(recipe1)
        admin.addToRecipes(recipe2)
        recipeCategoryA.addToRecipes(recipe1)
        recipeCategoryA.addToRecipes(recipe2)
        foodA.addToIngredients(ingredient)
        foodB.addToIngredients(ingredient2)
        recipe1.addToIngredients(ingredient)
        recipe2.addToIngredients(ingredient2)
        recipe1.save()
        recipe2.save()
        ingredient.save()
        ingredient2.save()
   


//
//
//        recipeCategoryA.addToRecipes(recipe1).save()
//        recipeCategoryB.addToRecipes(recipe2).save()

  //      role.save()
//        role2.save()

//
//        articleA.save()
//        articleB.save()
//        articleC.save()
//
//        categoryA.save()
//        categoryB.save()
//        categoryC.save()
//
//        commentA.save()
//
//        foodCategoryA.save()
//        unitA.save()
//        foodA.save()
//        foodB.save()
//        ingredient.save()
//        ingredient2.save()
//
//        recipeCategoryA.save()
//        recipeCategoryB.save()
//        recipe1.save()
//        recipe2.save() 

     }


     def destroy = {
     }
} 