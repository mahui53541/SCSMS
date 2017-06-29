package com.github.mahui53541.scsms.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 动态跳转控制器
 * @author Administrator
 *
 */
@Controller
public class JspController {
	@RequestMapping(value="/{formName}")
	public String jspReturn(@PathVariable String formName){
		return formName;		
	}
}
