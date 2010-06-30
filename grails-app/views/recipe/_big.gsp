<div class="Panel">
  <g:isLoggedIn>
    <%= link(action:'create') { 'Dodaj nowy przepis' }%>
  </g:isLoggedIn>

  <h1>${recipe.name}</h1>
  <h2>${recipe.user.username}</h2>
  <div class="Image">
    <img src="${resource(dir:'images',file:'ImageStu.png')}" alt="${recipe.name}" />
  </div>
  <div class="SmallPanel" style="float:right;">
    <ul>
      <g:each in="${recipe.ingredients}" var="ingredient">
        <li>${ingredient.food.name}</li>
      </g:each>
    </ul>
  </div>
  ${recipe.body.decodeHTML()}
</div>