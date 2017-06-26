package com.github.mahui53541.srs.controller;

import java.util.List;


import com.github.mahui53541.srs.daomain.Professor;
import com.github.mahui53541.srs.service.ProfessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 对教师进行增删查改,问题：教师编号无法以0开头，easyUI numberbox的bug
 * @author Administrator
 *
 */
@Controller
public class ProfessorController {
	@Autowired
	@Qualifier("professorService")
	private ProfessorService professorService;
	@RequestMapping(value="addProfessor")
	@ResponseBody
	public boolean addProfessor(@ModelAttribute Professor professor){
		boolean result=professorService.addProfessor(professor);		
		return result;
	}
	@RequestMapping(value="queryProfessor")
	@ResponseBody
	public  Object queryProfessor(){
		List<Professor> result=professorService.queryProfessor();
		return result;
	}
	@RequestMapping(value="deleteProfessor")
	@ResponseBody
	public ModelAndView deleteProfessor(String ssn,ModelAndView mv){
		boolean result=professorService.deleteProfessor(ssn);
		mv.setViewName("professorManager");
		mv.addObject("result", result);
		return mv;
	}
	@RequestMapping(value="updateProfessor")
	public ModelAndView updateProfessor(ModelAndView mv,
			@ModelAttribute Professor professor){
		boolean result=professorService.updateProfessor(professor);
		mv.setViewName("professorManager");
		mv.addObject("result", result);
		return mv;
	}
}
