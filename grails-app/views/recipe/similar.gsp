
<%@ page import="wegetarianice.Recipe" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="Panel">
      <g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
        <div class="SmallPanel">
          <%//recipeInstance = Recipe.get(recipeInstance.id)%>
          <h1><g:link action="show" id="${recipeInstance.slug}">${recipeInstance.name}</g:link></h1>
          <h2>Dodał: <g:link action="show" controller="user" id="${recipeInstance.user.id}">
              ${recipeInstance.user.username}
          </g:link></h2
         <div class="SubsectionImage">
            <img src="${resource(dir:'images',file:'ImageStu.png')}" alt="${recipeInstance.name}" />
          </div>
          <div class="SubsectionCategories">
            Kategorie: <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>
          </div>
        </div>
     </g:each>
    </div>
  </body>
</html>
