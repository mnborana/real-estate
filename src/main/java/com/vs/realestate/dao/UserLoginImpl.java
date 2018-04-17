package com.vs.realestate.dao;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.UserLogin;
import com.vs.realestate.utility.Cryptography;

@Repository
public class UserLoginImpl implements UserLoginDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	

	@Override
	public int AuthenticateUserDao(HttpServletRequest request) {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select username, password from UserLogin");
		List<Object[]> userList = query.getResultList();
		
		for (Object[] temp : userList) {
			if(temp[0].equals(username) && temp[1].equals(password)) {
				HttpSession httpSession = request.getSession();
				httpSession.setMaxInactiveInterval(1*60);
				httpSession.setAttribute("username", username);
				
				return 1;
			}
		}
		
		return 0;
	}

}
