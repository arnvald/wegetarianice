
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.SearchableUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.lucene.LuceneUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.util.StringQueryUtils" %>
<html>
  <head>
    <meta name="layout" content="main">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>Grails Searchable Plugin</title>
  </head>
  <body>
    <div id="Panel">
      <h1>Zaawansowane wyszukiwanie</h1>
      <h2>Wyszukiwanie przepisów</h2>
      <g:render template="/recipe/search" />
      <h2>Wyszukiwanie artykułów</h2>
      <g:render template="/article/search" />
    </div>
  </body>
</html>
