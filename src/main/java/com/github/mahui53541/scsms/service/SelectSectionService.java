package com.github.mahui53541.scsms.service;

import java.util.ArrayList;

import com.github.mahui53541.scsms.domain.Student;

public interface SelectSectionService {

	String selectSection(String ssn, int sectionNo);

	ArrayList<Student> queryEnrolledStudents(int sectionNo);

}
