package com.github.mahui53541.scsms.dao.provider;

import org.apache.ibatis.jdbc.SQL;

import com.github.mahui53541.scsms.domain.Professor;

public class ProfessorDynaSqlProvider {
	public String update(Professor professor){
		return new SQL(){
			{
			UPDATE("professor");
			if(professor.getDepartment()!=null){
				SET("department=#{department}");
			}
			if(professor.getName()!=null){
				SET("name=#{name}");
			}
			/*if(professor.getSsn()!=null){
				SET("ssn=#{ssn}");
			}*/
			if(professor.getTitle()!=null){
				SET("title=#{title}");
			}
			}	
		}.toString();
	}
}
