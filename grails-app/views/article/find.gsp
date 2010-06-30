
<%@ page import="wegetarianice.Article" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="Panel">
        <h1>Wyniki wyszukiwania</h1>
        <g:each in="${articleList}" var="article">
          <g:render template="/article/small" model="[article:article]" />
        </g:each>
      </div>
    </body>
</html>
