
<%@ page import="wegetarianice.Recipe" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="Panel">
      <h1>Dodaj przepis</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>

      <g:hasErrors bean="${recipeInstance}">
        <div class="errors">
            <g:renderErrors bean="${recipeInstance}" as="list" />
        </div>
      </g:hasErrors>

      <g:form action="save" method="post" >
        <label for="name">Nazwa</label>
        <g:textField name="name" value="${recipeInstance?.name}" class="Custom" />
        <label for="body">Treść</label>
        <fckeditor:editor
          name="body"
          width="650"
          height="400"
          toolbar="Basic"
          fileBrowser="default">
          ${recipeInstance?.body}
        </fckeditor:editor>
        <label for="category">Kategoria</label>
        <g:select name="category.id" from="${wegetarianice.RecipeCategory.list()}" optionKey="id" value="${recipeInstance?.category?.id}"  />
        <g:hiddenField name="user_id" value="1" />
        <span class="button"><g:submitButton name="create" class="save Custom" value="Utwórz" /></span>
      </g:form>
    </div>
  </body>
</html>
