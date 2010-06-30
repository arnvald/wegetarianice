
<%@ page import="wegetarianice.Article" %>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="layout" content="main" />
      <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
      <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="Panel">
      <g:render template="big" model="[article:article]" />
    </div>
  </body>
</html>
