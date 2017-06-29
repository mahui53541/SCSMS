package com.github.mahui53541.scsms.service;

import com.github.mahui53541.scsms.domain.Student;

public interface LoginService {
	/**
	 * 学生登陆
	 * @param ssn
	 * @param password
	 * @return
	 */
	Student studentLogin(String ssn, String password);
}
