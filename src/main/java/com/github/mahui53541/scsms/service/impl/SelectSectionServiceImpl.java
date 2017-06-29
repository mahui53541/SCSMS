package com.github.mahui53541.scsms.service.impl;

import java.util.ArrayList;

import com.github.mahui53541.scsms.domain.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.mahui53541.scsms.domain.SectionCatalog;
import com.github.mahui53541.scsms.domain.Student;
import com.github.mahui53541.scsms.domain.StudentCatalog;
import com.github.mahui53541.scsms.domain.Transcript;
import com.github.mahui53541.scsms.domain.TranscriptEntity;
import com.github.mahui53541.scsms.service.SelectSectionService;
import com.github.mahui53541.scsms.specification.Specification;
@Service("selectSectionService")
public class SelectSectionServiceImpl implements SelectSectionService {
	@Autowired
	@Qualifier("selectionSectionSpecification")
	private Specification<Section> selectionSectionSpecification;
	@Autowired
	private SectionCatalog sectionCatalog;
	@Autowired
	private StudentCatalog studentCatalog;
	@Autowired  
	private Transcript transcript;
	@Override
	public String selectSection(String ssn, int sectionNo) {
		// TODO Auto-generated method stub
		Section section=sectionCatalog.getMap().get(String.valueOf(sectionNo));
		Student student=studentCatalog.getMap().get(ssn);
		
		String result=selectionSectionSpecification.validate(student,section);
		if(result==null){//为null代表什么否定都没有触发，可选
			sectionCatalog.sectionAddEnrolledStudent(student,section);
			studentCatalog.studentAddAttends(student,section);
			TranscriptEntity entity=new TranscriptEntity(0.0,student,section);
			transcript.getMap().get(ssn).add(entity);
			result="选课成功！";
		}else{			
			return result;
		}
		return result; 
	}
	@Override
	public ArrayList<Student> queryEnrolledStudents(int sectionNo) {
		// TODO Auto-generated method stub
		Section section=sectionCatalog.getMap().get(String.valueOf(sectionNo));
		int size=section.getEnrolledStudents().size();
		ArrayList<Student> list=new ArrayList<Student>();
		for(int i=0;i<size;i++){
			Student s=new Student(section.getEnrolledStudents().get(i).getSsn(),section.getEnrolledStudents().get(i).getName(),
					section.getEnrolledStudents().get(i).getDegree(),section.getEnrolledStudents().get(i).getMajor());
			list.add(s);
		}
		return list;
	}

}
