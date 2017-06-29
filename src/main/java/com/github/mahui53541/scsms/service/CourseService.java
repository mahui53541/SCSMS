package com.github.mahui53541.scsms.service;

import java.util.HashMap;
import java.util.List;

import com.github.mahui53541.scsms.domain.Course;

public interface CourseService {

	List<HashMap<String, String>> queryCourse();

	boolean addCourse(Course course);

	boolean deleteCourse(String number);

	List<HashMap<String, String>> queryPrevCourse(String number);

	Course selectCourseByNum(String string);

}
