
<%@ page import="wegetarianice.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
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
            <g:hasErrors bean="${recipeInstance}">
            <div class="errors">
                <g:renderErrors bean="${recipeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                  <label for="body"><g:message code="recipe.body.label" default="Body" /></label>
                  <fckeditor:editor
                    name="body"
                    width="300"
                    height="400"
                    toolbar="Basic"
                    fileBrowser="default">
                    ${recipeInstance?.body}
                  </fckeditor:editor>
                  <label for="name"><g:message code="recipe.name.label" default="Name" /></label>
                  <g:textField name="name" value="${recipeInstance?.name}" />
                  <label for="description"><g:message code="recipe.description.label" default="Description" /></label>
                  <g:textField name="description" value="${recipeInstance?.description}" />
                  <label for="category"><g:message code="recipe.category.label" default="Category" /></label>
                  <g:select name="category.id" from="${wegetarianice.RecipeCategory.list()}" optionKey="id" value="${recipeInstance?.category?.id}"  />
                  <label for="user"><g:message code="recipe.user.label" default="User" /></label>
                  <g:select name="user.id" from="${wegetarianice.User.list()}" optionKey="id" value="${recipeInstance?.user?.id}"  />
                </div>
                <div class="buttons">
                  <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
