<div class="SmallPanel">
  <h1>
    <g:link action="show" id="${article.id}">${article.title}</g:link>
  </h1>
  <h2>Autor:
    <g:link controller="user" action="show" id="${article.user.id}">
      ${article.user.username}
    </g:link>
  </h2>

  ${article.description}

  <div class="SubsectionCategories">
    Kategorie: <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>
  </div>
</div>