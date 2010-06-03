
<%@ page import="wegetarianice.Article" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'article.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'article.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="body" title="${message(code: 'article.body.label', default: 'Body')}" />
                        
                            <th><g:message code="article.category.label" default="Category" /></th>
                   	    
                            <g:sortableColumn property="description" title="${message(code: 'article.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'article.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${articleInstanceList}" status="i" var="articleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${articleInstance.id}">${fieldValue(bean: articleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: articleInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: articleInstance, field: "body")}</td>
                        
                            <td>${fieldValue(bean: articleInstance, field: "category")}</td>
                        
                            <td>${fieldValue(bean: articleInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${articleInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${articleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
