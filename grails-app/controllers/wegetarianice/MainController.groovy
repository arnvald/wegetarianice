package wegetarianice

class MainController {
  
  def authenticateService

  def index = {
    def currentUser = currentUser()
    [currentUser : currentUser]
  }
  
  def currentUser() {
    return authenticateService.principal()
  }
}
