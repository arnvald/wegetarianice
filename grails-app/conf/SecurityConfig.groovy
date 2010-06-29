 security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "wegetarianice.User"
	authorityDomainClass = "wegetarianice.Role"
	requestMapClass = "wegetarianice.Requestmap" //chyba niepotrzebne skoro zrobilismy to z palca
        authenticationFailureUrl="/zaloguj"
        loginFormUrl="/zaloguj"

        //apropo pisania z palca to chyba japrosciej bedzie
        //jak wezmiemy ze w ogolnosci wszyscy maja dostep do wszystkiego
        //a tylko admin bedzie mial dostep do panelu admin
        //moderator do moderatora
        //a tyklo zalogowani to pewnych szczegolnych wlasciwosci zwiazanych ze swoim panelem

        requestMapString = '''CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
     PATTERN_TYPE_APACHE_ANT

    /artykuly/nowy/**=IS_AUTHENTICATED_REMEMBERED
    /artykuly/utworz/**IS_AUTHENTICATED_REMEMBERED
    /artykuly/edytuj/**=ROLE_ADMIN
    /artykuly/zaktualizuj/**=ROLE_ADMIN
    /artykuly/usun/**=ROLE_ADMIN

    /przepisy/nowy/**=IS_AUTHENTICATED_REMEMBERED
    /przepisy/utworz/**=IS_AUTHENTICATED_REMEMBERED
    /przepisy/edytuj/**=ROLE_ADMIN
    /przepisy/zaktualizuj/**=ROLE_ADMIN
    /przepisy/usun/**=ROLE_ADMIN

    /kategorie/nowa/**=ROLE_ADMIN
    /kategorie/utworz/**=ROLE_ADMIN
    /kategorie/edytuj/**=ROLE_ADMIN
    /kategorie/zaktualizuj/**=ROLE_ADMIN
    /kategorie/usun/**=ROLE_ADMIN

    /uzytkownicy/edytuj/**=ROLE_ADMIN
    /uzytkownicy/zaktualizuj/**=ROLE_ADMIN
    /uzytkownicy/**=ROLE_ADMIN
    /uzytkownicy/usun/**=ROLE_ADMIN
    /uzytkownicy/**=ROLE_ADMIN

    /artykuly/kategorie/nowa/**=ROLE_ADMIN
    /artykuly/kategorie/utworz/**=ROLE_ADMIN
    /artykuly/kategorie/edytuj/**=ROLE_ADMIN
    /artykuly/kategorie/zaktualizuj/**=ROLE_ADMIN
    /artykuly/kategorie/usun/**=ROLE_ADMIN


			'''
    useRequestMapDomainClass = false
}
