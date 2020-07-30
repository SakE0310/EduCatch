package com.kosmo.educatch.manager;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class SessionManager implements HttpSessionBindingListener{
private static Hashtable hashManager = new Hashtable();
	
	private SessionManager(){
		super();
	}
	
	public static SessionManager getInstance(){
		return SessionManager.LazyHolder.sManager;
	}
	
	public static class LazyHolder{
		private static final SessionManager sManager = new SessionManager();
	}
	
	public boolean isLogin(String sessionID){
		boolean isLogin = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()){
			key = (String)e.nextElement();
			
			if(sessionID.equals(key)){
				isLogin = true;
			}
		}
		return isLogin;
	}
	
	public boolean isUsing(String userID){
		boolean isFlag = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()){
			
			key = (String)e.nextElement();
			
			if (userID.equals(hashManager.get(key))){
				isFlag = true;
			}
		}
		
		return isFlag;
	}
	
	public void setSession(HttpSession hSession, List user){
		hashManager.put(hSession.getId(), user);
		hSession.setAttribute("login", this.getInstance());
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		hashManager.remove(event.getSession().getId());
	}
	
	public List getUserID(String sessionID){
		return (List)hashManager.get(sessionID);
	}
	
	public int getUSerCount(){
		return hashManager.size();
	}
}
