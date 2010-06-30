
<%@ page import="wegetarianice.Recipe" %>
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${recipeInstance}">
<div class="errors">
    <g:renderErrors bean="${recipeInstance}" as="list" />
</div>
</g:hasErrors>
<g:form action="find" controller="recipe" method="post" >
  <p>
    z tresci: <g:radio name="radioRecipeSearch" value="1"/>
    <g:textField name="searchByContent" value="${recipe?.name}" />
  </p>
  <p>
    ze skladnikow: <g:radio name="radioRecipeSearch" value="2" checked="true"/>
    <g:textField name="searchByIngridient" value="${recipe?.body}" />
  </p>
  <div class="buttons">
    <span class="button"><g:submitButton name="search" class="Custom" value="Szukaj" /></span>
  </div>
</g:form>