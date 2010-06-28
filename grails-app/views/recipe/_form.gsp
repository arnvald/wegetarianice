<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<g:hasErrors bean="${recipe}">
  <div class="errors">
      <g:renderErrors bean="${recipe}" as="list" />
  </div>
</g:hasErrors>

<g:form action="save" method="post" >
  <label for="name">Nazwa</label>
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
  <g:hiddenField name="user_id" value="1" />
  <span class="button"><g:submitButton name="create" class="save Custom" value="Utwórz" /></span>
</g:form>