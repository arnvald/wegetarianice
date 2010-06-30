<head>
	<meta name="layout" content="main" />
	<title>Show User</title>
</head>

<body>
	<div class="panel">

		<h1>${person.username}</h1>

		<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
		</g:if>

    ${person.userRealName?.encodeAsHTML()}
    
    <g:if test="${person.emailShow}">
      ${person.email?.encodeAsHTML()}
    </g:if>
	</div>
  <div class="Panel">
    <h1>Dodane przepisy</h1>
    <g:each in="${person.recipes}" var="recipe">
      <g:render template="/recipe/tiny" model="[recipe:recipe]" />
    </g:each>
  </div>
  <div class="Panel">
    <h1>Dodane artykuły</h1>
    <g:each in="${person.articles}" var="article">
      <g:render template="/article/small" model="[article:article]" />
    </g:each>
  </div>
</body>
