<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main" />
    <title>Log in</title>
  </head>
  <body>
    <div class="body">
      <h1>Please log in</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors>
        <div class="errors">
          <g:renderErrors bean="${user}" as="list" />
        </div>
      </g:hasErrors>
      <g:form controller="user" method="post" >
        <div class="dialog">
          <table>
            <tr class='prop'>
              <td valign='top' class='name'>
                <label for='userId'>User ID:</label>
              </td>
              <td valign='top' class='value '>
                <input type="text" maxlength='8' name='login' value='${user?.login}'></input>
              </td>
            </tr>
            <tr class='prop'>
              <td valign='top' class='name'>
                <label for='password'>Password:</label>
              </td>
              <td valign='top' class='value '>
                <input type="password" maxlength='8' name='password' value='${user?.password}'></input>
              </td>
            </tr>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <g:actionSubmit value="Log in" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
