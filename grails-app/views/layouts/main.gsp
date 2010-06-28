<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8;charset=utf-8" />
	<title>Wegetarianice</title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="jquery" />
  <g:javascript library="application" />
</head>

<body>
	<div id="LayoutContainer">

		<div id="MainHeaderContainer">
			<div id="HeaderContainer">
        <img class="Logo" src="${resource(dir:'images',file:'Logo0000.png')}" alt="Wegetarianice" />
        <g:form url='[controller: "searchable", action: "index"]' id="compactSearchableForm" name="searchableForm" method="get" style="float: right; margin-top: 31px;">
          <g:submitButton name="Search" class="Icon CompactSearchIcon" style="float: right;" value="" />
          <g:textField name="q" value="${params.q}" class="AutoClear CustomWithIcon"/>
        </g:form>
			</div>
		</div>

		<div id="MainMenuContainer">
			<div id="MenuContainer">
				<ul class="MainMenu">
          <li><g:link controller="main" action="list" class="Home"/></li>
          <li><g:link controller="recipe" action="list" class="Recipes" /></li>
          <li><g:link controller="article" action="list" class="Knowledge"/></li>
          <li><g:link controller="searchable" action="list" class="Search"/></li>
          <li><g:link controller="pages" class="Contact"/></li>
				</ul>
			</div>
		</div>

		<div id="MainContainer">
			<div id="MainContentContainer">
        <g:layoutBody />
			</div>
      
			<div id="SidebarContainer">
        <g:render template="/sidebar" />
			</div>
		</div>

	</div>
	
	<div id="MainFootageContainer">
    <g:render template="/footer" />
	</div>

</body>
</html>