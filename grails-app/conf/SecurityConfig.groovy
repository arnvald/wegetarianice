security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "wegetarianice.User"
	authorityDomainClass = "wegetarianice.Role"
	requestMapClass = "wegetarianice.Requestmap"
//        requestMapString = '''CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
//			  PATTERN_TYPE_APACHE_ANT
//			  /login/**=IS_AUTHENTICATED_ANONYMOUSLY
//			  /captcher/**=ROLE_USER
//                          /role/**=IS_AUTHENTICATED_FULLY
//                          /user/**=ROLE_SUPERVISOR
//			'''
//    useRequestMapDomainClass = false
}
