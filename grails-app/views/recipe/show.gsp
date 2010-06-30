
<%@ page import="wegetarianice.Recipe" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <g:render template="big" model="[recipe:recipe]" />
    <div class="Panel">
      <g:each in="${recipe.getSimilar()}" var="similar">
        <g:render template="tiny" model="[recipe:similar]" />
      </g:each>
    </div>
  </body>
</html>
