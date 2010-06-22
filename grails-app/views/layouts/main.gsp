<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8;charset=utf-8" />
	<title>Wegetarianice - twoja stara</title>
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
				<a class="CompactSearch" href=""><img src="${resource(dir:'images',file:'ButtonIn.png')}" alt="Szukaj..." /></a>
				<input id="CompactSearchInput" class="AutoClearInput CompactSearch CustomInput" type="text" value="Wyszukaj..." />
			</div>
		</div>

		<div id="MainMenuContainer">
			<div id="MenuContainer">
				<ul class="MainMenu">
					<li><a class="Home" href="/"></a></li>
					<li><a class="Recipes" href="/przepisy"></a></li>
					<li><a class="Knowledge" href="/artykuly"></a></li>
					<li><a class="Search" href="/szukaj"></a></li>
					<li><a class="Contact" href="/kontakt"></a></li>
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