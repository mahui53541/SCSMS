package com.github.mahui53541.srs.specification;

import com.github.mahui53541.srs.daomain.Section;
import com.github.mahui53541.srs.daomain.Student;

public interface Specification<T> {
	String validate(Student student, Section section);
}
