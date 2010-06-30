<h1>${article.title}</h1>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<h2>Autor :
  <g:link controller="user" action="show" id="${article.user.username}">
    ${article.user.username}
  </g:link>
</h2>

${article.body}