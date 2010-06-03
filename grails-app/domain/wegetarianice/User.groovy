package wegetarianice

import wegetarianice.Role

/**
 * User domain class.
 */
class User {
	static transients = ['pass']
	static hasMany = [authorities: Role,  articles:Article, recipes:Recipe, comments:Comment]
	static belongsTo = Role

        //wegetarianice fields

        String website
        Date dateCreated
        Date lastUpdated


	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled

	String email
	boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(blank: false, unique: true ,minLength: 4, maxLength: 32)
		userRealName(blank: true)
		passwd(blank: false, minLength: 6, maxLength: 64)
                email(email: true, blank: false)
                website(url: true, nullable: true)
		lastUpdated(nullable: true)
                enabled()
	}
}
