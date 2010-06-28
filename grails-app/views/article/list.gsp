<%@page import="wegetarianice.Article" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  
  <body>

    <div class="Panel">
      <g:isLoggedIn>
        <g:link action="create">Dodaj artykuł</g:link>
      </g:isLoggedIn>

      <h1>Artykuły</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
    
      <g:each in="${articleList}" status="i" var="article">
        <div class="SmallPanel">
          <h1>
            <g:link action="show" id="${article.id}">${article.title}</g:link>
          </h1>
          <h2>Autor:
            <g:link controller="user" action="show" id="${article.user.id}">
              ${article.user.username}
            </g:link>
          </h2>
          
          ${article.description}

          <div class="SubsectionCategories">
            Kategorie: <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>, <a href="">Lorem ipsum</a>
          </div>
        </div>
      </g:each>

      <div class="paginateButtons">
          <g:paginate total="${articleTotal}" />
      </div>
    </div> <%-- /Panel --%>
  </body>
</html>
