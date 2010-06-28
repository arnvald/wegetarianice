<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="wegetarianice.RecipeService"%>

<html>
  <head>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="Panel">
      <div style="float: right;">
        <input type="button" class="CustomCircle" value="1" />
        <input type="button" class="CustomCircle" value="2" />
        <input type="button" class="CustomCircle" value="3" />
        <input type="button" class="CustomCircle" value="4" />
        <input type="button" class="CustomCircle" value="5" />
      </div>
      <h1>Przepisy tygodnia</h1>
      <h2>Lorem ipsum dolor sit amet</h2>
      <div class="Image"><img src="${resource(dir:'images',file:'ImageStu.png')}" alt="Lorem ipsum dolor sit amet" /></div>
        Tu będzie opis przepisu
        <div class="SubsectionMore">
          <g:form action="show" controller="recipe" id="1">
            <g:submitButton name ="more" class="CustomSmall" value="Więcej..." />
          </g:form>
				</div>
    </div>

    <div class="Panel">
      <div class="SmallPanel">
        <h1>Najnowsze przepisy</h1>
        <ul>
          <g:each in="${RecipeService.newest()}" var="recipe" >
            <li><g:link controller="recipe" action="show" id="recipe.slug">${recipe.name}</g:link></li>
          </g:each>
        </ul>
      </div>

      <div class="SmallPanel">
        <h1>Popularne przepisy</h1>
        <ul>
          <g:each in="${RecipeService.popular()}" var="recipe">
            <li><g:link controller="recipe" action="show" id="${recipe.slug}">${recipe.name}</g:link></li>
          </g:each> 
        </ul>
      </div>

      <div class="SmallPanel">
        <h1>Popularne tagi</h1>
        <ul>
          <li>Tu będą popularne tagi</li>
        </ul>
      </div>
    </div>
  </body>
</html>
