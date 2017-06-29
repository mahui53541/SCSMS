package com.github.mahui53541.scsms.domain;

public class PrevCourse {
	private Course course;
	private Course prevCourse;
	public PrevCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PrevCourse(Course course, Course prevCourse) {
		super();
		this.course = course;
		this.prevCourse = prevCourse;
	}

	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Course getPrevCourse() {
		return prevCourse;
	}
	public void setPrevCourse(Course prevCourse) {
		this.prevCourse = prevCourse;
	}
	
}
