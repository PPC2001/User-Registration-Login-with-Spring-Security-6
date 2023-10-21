package com.pms.app.constants;

public class PMSConstants {

	public PMSConstants() {
		throw new IllegalStateException("Utility Class");
	}

	public static final String SPRING_BASE_CLASS_PROPERTYSOURCE = "classpath:application.properties";

	// Database properties
	public static final String DATASOURCE_DRIVER_CLASS_NAME = "spring.datasource.driver-class-name";
	public static final String DATASOURCE_URL = "spring.datasource.url";
	public static final String DATASOURCE_USERNAME = "spring.datasource.username";
	public static final String DATASOURCE_PASSWORD = "spring.datasource.password";

	// Hibernate properties
	public static final String HIBERNATE_DIALECT = "org.hibernate.dialect.Oracle12cDialect";

	// JPA properties
	public static final String JPA_PACKAGES_TO_SCAN = "com.pms.app.entity";

}
