
<%@ page import="wegetarianice.Article" %>
<g:form action="find" method="post" controller="article" >
  <div class="dialog">
    <table>
      <tbody>
        <tr class="prop">
          <td valign="top" class="name">
            <label for=""><g:message code="article.title.label" default="Szukaj po: " /></label>
          </td>
          <td>
            nazwie  <g:checkBox name="name" value="${true}" />
            tresci <g:checkBox name="body" value="${false}" />
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
          <td valign="top" class="value ${hasErrors(bean: article, field: 'body', 'errors')}">
            <g:textField name="query" value="${article?.body}" />
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="buttons">
    <span class="button"><g:submitButton name="Szukaj" class="Custom" value="${message(code: 'default.button.search.label', default: 'Szukaj')}" /></span>
  </div>
</g:form>
