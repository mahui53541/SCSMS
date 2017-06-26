package com.github.mahui53541.srs.daomain;

import java.util.ArrayList;

public class Professor extends Person{
	private String title;//职称
	private String department;//哪个学院
	private ArrayList<Section> teaches;//教了那些课
	
	public Professor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Professor(String ssn, String name) {
		super(ssn, name);
		// TODO Auto-generated constructor stub
	}
	public Professor(String name,String ssn,String title, String department) {
		super(name,ssn);
		this.title = title;
		this.department = department;
		teaches=new ArrayList<Section>();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public ArrayList<Section> getTeaches() {
		return teaches;
	}
	public void setTeaches(ArrayList<Section> teaches) {
		this.teaches = teaches;
	}
	
}



