<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="wegetarianice.RecipeCategory"%>
<html>
  <body>
    <div class="Panel">
      <h1>Moje konto</h1>
      <g:isLoggedIn>
        Zalogowany jako...
      </g:isLoggedIn>
      <g:isNotLoggedIn>
      <h2>Witaj nieznajomy!</h2>
      <g:form action="j_spring_security_check" controller="">
        <g:textField id="j_username" name="j_username" value="Login" class="AutoClearInput Custom" />
        <g:passwordField id="j_password" name="j_password" value="Hasło" class="AutoClearInput CustomWithIconSmall" />
        <input type="button" class="IconSmall QuestionIcon" value="" />
        <div style="clear: both;"></div>
				<g:checkBox class="Custom" name="RememberMe" value="True" />Pamiętaj mnie<br /><br />
        <g:submitButton class="Custom" value="Zaloguj" name="Login" />
        <g:submitButton class="Custom" value="Zarejestruj" name="Register"/>
      </g:form>
      </g:isNotLoggedIn>
    </div>

    <div class="Panel">
      <h1>Kategorie</h1>
      <ul class="Menu">
        <g:each in="${RecipeCategory.getAll()}" var="category">
          <li> <g:link controller="RecipeCategory" action="show" id="${category.id}"> ${category.name} </g:link> </li>
        </g:each>
      </ul>
    </div>
    <!-- /categories -->

    <div class="Panel">
      <h1>Newsletter</h1>
      <g:form method="post">
				<g:textField name="NewsletterEmail" class="AutoClear CustomWithIcon" value="Dodaj swój adres e-mail" />
				<g:actionSubmit class="Icon NewsletterIcon" value="a" action="" />
			</g:form>
    </div>
    <!-- /newsletter -->

    <div class="Panel">
      <a href=""><img src="${resource(dir:'images',file:'RssButton.png')}" alt="Subskrybuj RSS!" /></a>
    </div>
    <!-- /rss -->

  </body>
</html>
