
<%@ page import="wegetarianice.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="Panel">
        <h1>Edytuj przepis</h1>
        <g:render template="form" />
      </div>
    </body>
</html>
