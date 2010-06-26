<%@ page contentType="text/html;charset=UTF-8" %>

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
        <g:textField id="j_username" name="j_username" value="Login" class="AutoClearInput CustomInput" />
        <g:passwordField id="j_password" name="j_password" value="Hasło" class="AutoClearInput CustomInput" />
        <g:actionSubmit value="Zaloguj" action="j_spring_security_check" />
        <g:link>
          <img src="${resource(dir:'images',file:'ButtonRe.png')}" alt="Zarejestruj" />
        </g:link>
      </g:form>
      </g:isNotLoggedIn>
    </div>

    <div class="Panel">
      <h1>Kategorie</h1>
      <ul class="Menu">
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
        <li><a href="">Lorem ipsum dolor sit amet</a></li>
      </ul>
    </div>
    <!-- /categories -->

    <div class="Panel">
      <h1>Newsletter</h1>
      <input id="NewsletterEmailInput" class="AutoClearInput CustomInput Newsletter" value="Dodaj swój adres e-mail" />
      <a class="Newsletter" href=""><img src="${resource(dir:'images',file:'ButtonIo.png')}" alt="+" /></a>
    </div>
    <!-- /newsletter -->

    <div class="Panel">
      <a href=""><img src="${resource(dir:'images',file:'RssButto.png')}" alt="Subskrybuj RSS!" /></a>
    </div>
    <!-- /rss -->

  </body>
</html>
