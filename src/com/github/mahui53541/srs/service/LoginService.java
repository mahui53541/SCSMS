package com.github.mahui53541.srs.service;

import com.github.mahui53541.srs.daomain.Student;

public interface LoginService {
	/**
	 * 学生登陆
	 * @param ssn
	 * @param password
	 * @return
	 */
	Student studentLogin(String ssn, String password);
}
