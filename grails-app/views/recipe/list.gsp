
<%@ page import="wegetarianice.Recipe" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>

  <body>
    <g:isLoggedIn>
      <%= link(action:'create') { 'Dodaj nowy przepis' }%>
    </g:isLoggedIn>

    <div class="Panel">
      <g:each in="${recipeList}" status="i" var="recipe">
        <div class="SmallPanel">
          <h1><g:link controller="recipe" action="show" id="${recipe.slug}">${recipe.name}</g:link></h1>
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
      </g:each>
    </div>

  </body>
</html>
