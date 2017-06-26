package com.github.mahui53541.srs.dao;

import java.util.ArrayList;

import com.github.mahui53541.srs.daomain.Course;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public interface CourseDao {
	
	@Select("select * from course")
	@Results({
		@Result(id=true,column="number",property="number"),
		@Result(column="name",property="name"),
		@Result(column="credits",property="credits"),
		@Result(column="number",property="prevCourse",
			many=@Many(select="com.srs.dao.CourseDao.selectPrevCourseByNumber",
				fetchType=FetchType.EAGER))
	})
	ArrayList<Course> load();
	
	@Select("select * from course where number in (select pev_course_number from prevcourse where course_number =#{number})")
	@Results({
		@Result(id=true,column="number",property="number"),
		@Result(column="name",property="name"),
		@Result(column="credits",property="credits")
	})
	ArrayList<Course> selectPrevCourseByNumber(String number);
	
	@Select("select * from course where number=#{number}")
	@Results({
		@Result(id=true,column="number",property="number"),
		@Result(column="name",property="name"),
		@Result(column="credits",property="credits"),
		@Result(column="number",property="prevCourse",
			many=@Many(select="com.srs.dao.CourseDao.selectPrevCourseByNumber",
				fetchType=FetchType.LAZY))
	})
	Course selectCourseByNum(String number);
	
	@Insert("insert into course (number,name,credits) values(#{number},#{name},#{credits})")
	void insertCourse(Course course);
	
	@Insert("insert into prevcourse (course_number,pev_course_number) values(#{number},#{prev_number})")
	void insertPrevCourse(@Param("number")String number, @Param("prev_number")String prev_number);
	
	@Delete("delete from course where number=#{number}")
	void deleteCourseByNumber(String number);
	
	@Select("select * from course where number in (select number from planofstudy where ssn=#{ssn})")
	@Results({
		@Result(id=true,column="number",property="number"),
		@Result(column="name",property="name"),
		@Result(column="credits",property="credits"),
		@Result(column="number",property="prevCourse",
			many=@Many(select="com.srs.dao.CourseDao.selectPrevCourseByNumber",
				fetchType=FetchType.LAZY))
	})
	ArrayList<Course> selectByStudentSn(String ssn);
}
