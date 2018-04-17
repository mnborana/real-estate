package com.vs.realestate.dao;

import javax.servlet.http.HttpServletRequest;

public interface UserLoginDAO {
	
	public int AuthenticateUserDao(HttpServletRequest request);
	
}
