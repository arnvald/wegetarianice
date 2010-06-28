package wegetarianice

import wegetarianice.Role

/**
 * User domain class.
 */


class User {

        def searchable = true;

        static transients = ['pass']
	static hasMany = [authorities: Role,  articles:Article, recipes:Recipe, comments:Comment]
	static belongsTo = Role

	String username
	String userRealName
	String passwd
	boolean enabled = false
	String email
	boolean emailShow = false
  String website
  Date dateCreated
  Date lastUpdated

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(blank: false, unique: true ,minLength: 4, maxLength: 32)
		userRealName(blank: true, nullable: true)
		passwd(blank: false, minLength: 6, maxLength: 64)
    email(email: true, blank: false)
    emailShow(blank: false)
    website(url: true, nullable: true)
		lastUpdated(nullable: true)
    enabled()
	}
}
