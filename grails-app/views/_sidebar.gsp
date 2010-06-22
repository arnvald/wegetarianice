<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <body>
    <div class="Panel">
      <h1>Moje konto</h1>
      <h2>Witaj nieznajomy!</h2>
      <a class="Button" href=""><img src="${resource(dir:'images',file:'ButtonLo.png')}" alt="Zaloguj" /></a>
      <a class="Button" href=""><img src="${resource(dir:'images',file:'ButtonRe.png')}" alt="Zarejestruj" /></a>
    </div>
    <!-- /account -->

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
