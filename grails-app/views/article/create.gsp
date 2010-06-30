
<%@ page import="wegetarianice.Article" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
    <body>
      <div class="Panel">
        <h1>Dodaj artykuł</h1>
        <g:render template="form" model="[article:article]" />
      </div>
  </body>
</html>
