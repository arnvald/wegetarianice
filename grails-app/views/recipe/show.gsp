
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
      <g:isLoggedIn>
        <%= link(action:'create') { 'Dodaj nowy przepis' }%>
      </g:isLoggedIn>

			<h1>${recipe.name}</h1>
      <h2>${recipe.user.username}</h2>
      <div class="Image">
        <img src="${resource(dir:'images',file:'ImageStu.png')}" alt="${recipe.name}" />
      </div>
      ${recipe.body}
    </div>
  </body>
</html>
