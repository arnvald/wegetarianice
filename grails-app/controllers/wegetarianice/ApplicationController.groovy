package wegetarianice

class ApplicationController {

  def auth = {
    if(!session.login) {
      def originalRequestParams = [controller:controllerName, action:actionName]
        originalRequestParams.putAll(params)
        session.originalRequestParams = originalRequestParams
      redirect(controller:'user',action:'login')
      return false
    }
    return true
  }
}

