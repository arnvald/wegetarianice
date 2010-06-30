
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
      <h1>Wyniki wyszukiwania</h1>
      <g:each in="${recipeInstanceList}" status="i" var="recipe">
        <g:render template="small" model="recipe:recipe" />
     </g:each>
    </div>
  </body>
</html>
