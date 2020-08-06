package com.kosmo.educatch.manager;

import org.apache.log4j.Logger;

public class LoggerManager {
	private static LoggerManager loggerManager;
	
	private LoggerManager() {
		
	}
	
	public static LoggerManager getInstance() {
		return LoggerManager.LazyHolder.lManager;
	}
	
	public static class LazyHolder{
		private static final LoggerManager lManager = new LoggerManager();
	}
	
	public Logger getLogger(Class c) {
		return Logger.getLogger(c);
	}
}
