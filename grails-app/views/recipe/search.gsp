
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
            <g:form action="find" method="post" >
              <p>
                z tresci: <g:radio name="radioRecipeSearch" value="1"/>
                <g:textField name="searchByContent" value="${recipe?.name}" />
              </p>
              <p>
                z skladnikow: <g:radio name="radioRecipeSearch" value="2" checked="true"/>
                <g:textField name="searchByIngridient" value="${recipe?.body}" />
              </p>
              <div class="buttons">
                <span class="button"><g:submitButton name="search" class="search" value="Szukaj" /></span>
              </div>
            </g:form>
        </div>
    </body>
</html>
