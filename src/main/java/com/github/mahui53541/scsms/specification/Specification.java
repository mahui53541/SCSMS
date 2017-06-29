package com.github.mahui53541.scsms.specification;

import com.github.mahui53541.scsms.domain.Section;
import com.github.mahui53541.scsms.domain.Student;

public interface Specification<T> {
	String validate(Student student, Section section);
}
