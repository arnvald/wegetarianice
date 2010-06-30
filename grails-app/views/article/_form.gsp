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
    <label for="title">Tytuł</label>
    <g:textField name="title" value="${article?.title}" class="AutoClear Custom" value="Tytuł"/>
    <label for="body">Treść</label>
    <fckeditor:editor
      name="body"
      width="650"
      height="400"
      toolbar="Basic"
      fileBrowser="default">
      ${recipeInstance?.body}
    </fckeditor:editor>
    <label for="category"><g:message code="article.category.label" default="Category" /></label>
    <select name="category.id" from="${wegetarianice.ArticleCategory.list()}" optionKey="id" value="${article?.category?.id}"  />
    <label for="description">Streszczenie</label>
    <g:textArea name="description" value="${article?.description}" class="AutoClear Custom" value="Krótki opis"/>
  </div>
  <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save Custom" value="Utwórz" /></span>
  </div>
</g:form>