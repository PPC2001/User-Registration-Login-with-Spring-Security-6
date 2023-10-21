package com.pms.app.config;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
@Component
public class HttpSessionConfig implements HttpSessionListener {

	private static final Logger logger = Logger.getLogger("Log_Master");

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		logger.info("-----session Created-----" + se.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		logger.info("-----session Destroyed-----" + se.getSession().getId());
	}
}
