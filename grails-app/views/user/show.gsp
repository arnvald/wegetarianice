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
    
    <g:if test="${pserson.emailShow}">
      ${person.email?.encodeAsHTML()}
    </g:if>

    <g:each in="${roleNames}" var='name'>
      <li>${name}</li>
    </g:each>

	</div>
</body>
