
<%@ page import="wegetarianice.Recipe" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <g:isLoggedIn>
      <%= link(action:'create') { 'Dodaj nowy przepis' }%>
    </g:isLoggedIn>
    <div class="panel">
			<h1>${recipeInstance.name}</h1>
      <h2>${recipeInstance.user.username}</h2>
      <div class="Image">
        <img src="${resource(dir:'images',file:'ImageStu.png')}" alt="${recipeInstance.name}" />
      </div>
      ${recipeInstance.body}
    </div>
  </body>
</html>
