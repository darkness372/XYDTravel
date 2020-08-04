package com.edu118.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu118.api.BaseController;
import com.edu118.entity.Employee;
import com.edu118.service.EmployeeService;
import com.edu118.utils.MD5Utils;
import com.edu118.utils.PinYinUtils;
import com.edu118.validateGroup.IAddGroups;

@Controller
@RequestMapping("/pages/emp/emp/")
public class AddController extends BaseController{
	@Autowired
	private EmployeeService employeeService;
		@PostMapping("/addEmp")
		@RequiresPermissions("emp:add")
		public ModelAndView addEmp(@Validated(IAddGroups.class)Employee emp,MultipartFile file,HttpServletRequest request) {
			//获取当前的时间
			LocalDateTime localDate = LocalDateTime.now();
			String date = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			emp.setHiredate(date);
			
			//获取拼音
			String py = PinYinUtils.getPinYinHeadChar(emp.getEname());
			emp.setEmpNumber("XYD-"+py+"-"+localDate.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")));
			//密码加密
			emp.setPassword(MD5Utils.getPassword(emp.getPassword()));
			logger.info("Emp={}",emp);
			logger.info("file={}",file);
			if (null != file) {		//上传文件
				String contentType = file.getContentType();
				System.out.println("上传文件的类型：" + contentType);
				//对类型进行逻辑处理，如果不是图片，返回错误信息。if("jpg|jpeg|png".contains(contentType)){}
				
				String fileName = upLoadFile(request,file,emp.getEmpNumber());
				emp.setPhoto(fileName);
			}
			//保存
			employeeService.insertEntity(emp);
			String sessionId = request.getHeader("xydLoginToke");
			request.getSession().setAttribute("loginSessionId", sessionId);
			//ModelAndView modelAndView = new ModelAndView("/pages/emp/emp_add.jsp");
	ModelAndView modelAndView = new ModelAndView("/pages/emp/emp_add.jsp");
			modelAndView.addObject("message", "数据添加完成！");
			return modelAndView;
		}// 相应角色才可以操作
		private String upLoadFile(HttpServletRequest request, MultipartFile multipartFile, String empNumber) {
			try {
				//可以使用IO流实现数据的保存，也可以使用SpringMvc提供的方法实现保存
				//InputStream inputStream = multipartFile.getInputStream();
				
				//保存到当前项目的webbapp下的images/photo
				String path = request.getServletContext().getRealPath("/images/photo");
				System.out.println("path = " + path);
				
				//文件后缀的获取 
				String name = multipartFile.getOriginalFilename();
				String hz = name.substring(name.lastIndexOf("."));
				String fileName = empNumber + hz;
				File file = new File(path + "/" + fileName);
				System.out.println("file = " + file);
				
				multipartFile.transferTo(file);
				
				return fileName;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
}
