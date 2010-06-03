import wegetarianice.Role
import wegetarianice.User
class BootStrap {





     def init = { servletContext ->

        def role = new Role(authority: 'ROLE_ADMIN', description: 'Admin role')
        def role2 = new Role(authority: 'ROLE_USER', description: 'User role').save()
        def admin = new User(username:"Filipek",userRealName:"Wisniewski",passwd:"test1234",email:"pejot88@o2.pl")
        def user = new User(username:"Grzesiek",userRealName:"Witek",passwd:"test1234",email:"pejot88@o2.pl")

       //                       passwd: authenticateService.encodePassword('admin'),
       //                       enabled: true, email: 'admin@servername')
        admin.addToAuthorities(role)
        admin.addToAuthorities(role2)
        //role.save()
       // role2.save()
        admin.save()
        user.save()
     }


     def destroy = {
     }
} 