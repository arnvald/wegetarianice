dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
             dataSource {
                   dbCreate = "update"
                   url = "jdbc:mysql://localhost/wegetarianiceDB??useUnicode=true&characterEncoding=UTF-8"
                   driverClassName = "com.mysql.jdbc.Driver"
                   dialect ="org.hibernate.dialect.MySQLDialect"
                   username = "root"
                   password = ""
              }
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:file:prodDb;shutdown=true"
		}
	}

}