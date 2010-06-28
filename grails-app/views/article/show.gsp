
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
      <h1>${article.title}</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>

      <h2>Autor :
        <g:link controller="user" action="show" id="${article.user.username}">
          ${article.user.username}
        </g:link>
      </h2>

      ${article.body}

    </div>
  </body>
</html>
