package com.github.mahui53541.srs.service;

import java.util.ArrayList;

import com.github.mahui53541.srs.daomain.Student;

public interface SelectSectionService {

	String selectSection(String ssn, int sectionNo);

	ArrayList<Student> queryEnrolledStudents(int sectionNo);

}
