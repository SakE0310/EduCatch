package com.kosmo.educatch.manager;

import java.io.File;
import java.util.regex.Matcher;

public class FilePathManager {
	private static FilePathManager filePathManager;
	
	private FilePathManager() {
		
	}
	
	public static FilePathManager getInstance() {
		return FilePathManager.Init.fManager;
	}
	
	public static class Init{
		private static final FilePathManager fManager = new FilePathManager();
	}
	
	public String changePath(String path) {
		return path.replaceAll("/", Matcher.quoteReplacement(File.separator));
	}
}
