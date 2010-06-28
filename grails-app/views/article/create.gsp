
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
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${article}">
            <div class="errors">
                <g:renderErrors bean="${article}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="article.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: article, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${article?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body"><g:message code="article.body.label" default="Body" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: article, field: 'body', 'errors')}">
                                    <g:textField name="body" value="${article?.body}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category"><g:message code="article.category.label" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: article, field: 'category', 'errors')}">
                                    <g:select name="category.id" from="${wegetarianice.ArticleCategory.list()}" optionKey="id" value="${article?.category?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="article.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: article, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${article?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="article.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: article, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${wegetarianice.User.list()}" optionKey="id" value="${article?.user?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
