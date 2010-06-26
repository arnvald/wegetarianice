
<%@ page import="wegetarianice.Article" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
          <g:form action="find" method="get" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for=""><g:message code="article.title.label" default="Szukaj po: " /></label>
                                </td>
                                <td>
                                    nazwie  <g:checkBox name="name" value="${true}" />
                                    trescie <g:checkBox name="body" value="${false}" />
                                    opisie  <g:checkBox name="description" value="${false}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="similar"><g:message code="article.title.label" default="Szukaj podobnych " /></label>
                                </td>
                                <td>
                                    <g:checkBox name="similar" value="${false}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'body', 'errors')}">
                                    <g:textField name="query" value="${articleInstance?.body}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="Szukaj" class="search" value="${message(code: 'default.button.search.label', default: 'Szukaj')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
