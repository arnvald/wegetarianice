<div class="SmallPanel">
  <h1><g:link action="show" id="${recipe.slug}">${recipe.name}</g:link></h1>
  <h2>Dodał: <g:link action="show" controller="user" id="${recipe.user.id}">
      ${recipe.user.username}
  </g:link></h2>
  <div class="SubsectionImage">
    <img src="${resource(dir:'images',file:'ImageStu.png')}" alt="${recipe.name}" />
  </div>
  <div class="SubsectionCategories">
    Kategoria: <g:link controller="recipeCategory" action="show" id="${recipe.category.slug}">${recipe.category.name}</g:link>
  </div>
</div>