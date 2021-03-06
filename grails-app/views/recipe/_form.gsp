<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<g:hasErrors bean="${recipe}">
  <div class="errors">
      <g:renderErrors bean="${recipe}" as="list" />
  </div>
</g:hasErrors>
<g:form action="${actionName == 'create' ? 'save' : 'update'}" method="post" >
  <label for="name">Nazwa</label>
  <g:hiddenField name="id" value="${recipe?.slug}" />
  <g:textField name="name" value="${recipe?.name}" class="Custom" />
  <label for="body">Treść</label>
  <fckeditor:editor
    name="body"
    width="650"
    height="400"
    toolbar="Basic"
    fileBrowser="default">
    ${recipe?.body}
  </fckeditor:editor>
  <label for="category">Kategoria</label>
  <g:select name="category.id" from="${wegetarianice.RecipeCategory.list()}" optionKey="id" value="${recipe?.category?.id}"  />
  <label for="recipes">Składniki</label>
  <g:textField name="ings" value="" />
  <g:hiddenField name="user_id" value="${loggedInUserInfo(field:'id')}" />
  <span class="button"><g:submitButton name="create" class="save Custom" value="Zapisz" /></span>
</g:form>