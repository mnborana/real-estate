package com.vs.realestate.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.UserLoginDAO;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	
	@Autowired
	UserLoginDAO userLoginDao;

	@Override
	@Transactional
	public int AuthenticateUserService(HttpServletRequest request) {
		
		return userLoginDao.AuthenticateUserDao(request);
	
	}
	
}
