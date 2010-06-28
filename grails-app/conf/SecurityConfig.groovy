 security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "wegetarianice.User"
	authorityDomainClass = "wegetarianice.Role"
	requestMapClass = "wegetarianice.Requestmap" //chyba niepotrzebne skoro zrobilismy to z palca

        //apropo pisania z palca to chyba japrosciej bedzie
        //jak wezmiemy ze w ogolnosci wszyscy maja dostep do wszystkiego
        //a tylko admin bedzie mial dostep do panelu admin
        //moderator do moderatora
        //a tyklo zalogowani to pewnych szczegolnych wlasciwosci zwiazanych ze swoim panelem

        requestMapString = '''CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
			  PATTERN_TYPE_APACHE_ANT
			  /login/**=IS_AUTHENTICATED_ANONYMOUSLY
                          /przepisy/dodaj**=IS_AUTHENTICATED_REMEMBERED
			  /admin/**=ROLE_ADMIN
                          /artykuly/dodaj/**
                          /role/**=IS_AUTHENTICATED_FULLY
			'''
    useRequestMapDomainClass = false
}
