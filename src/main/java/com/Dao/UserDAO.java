package com.Dao;

import com.entity.User;

public interface UserDAO {

	public boolean UserRegister(User user);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
