<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <body>
    <div id="FootageContainer">
			<img style="float: left; margin-right: 90px" src="${resource(dir:'images',file:'Copyright.png')}" alt="Copyright 2010 by Wegetarianice.pl" />
			<a href="http://www.punish3r.neostrada.pl/" target="_blank">
				<img style="float: left;" src="${resource(dir:'images',file:'punish3r.png')}" alt="punish3r design" />
			</a>
			<ul class="Navigation" style="float: right;">
        <li><g:link controller="main"><img src="${resource(dir:'images',file:'NavHome.png')}" alt="Główna" /></g:link></li>
        <li><g:link controller="recipe"><img src="${resource(dir:'images',file:'NavRecipe.png')}" alt="Przepisy" /></g:link></li>
				<li><g:link controller="article"><img src="${resource(dir:'images',file:'NavKnowledge.png')}" alt="Wiedza" /></g:link></li>
				<li><g:link controller="searchable"><img src="${resource(dir:'images',file:'NavSearch.png')}" alt="Wyszukaj" /></g:link></li>
				<li><g:link url="/kontakt"><img src="${resource(dir:'images',file:'NavContact.png')}" alt="Kontakt" /></g:link></li>
			</ul>
		</div>
  </body>
</html>
