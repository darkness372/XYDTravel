package com.edu118.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu118.api.BaseController;
import com.edu118.entity.Level;
import com.edu118.service.LevelService;
import com.edu118.utils.MyResult;

@Controller
@RequestMapping("pages/level")
public class LevelController extends BaseController{
	@Autowired
	private LevelService levelService;
	@GetMapping("/findLevel")
	@ResponseBody		//把返回值序列化成JSON返回到页面的Body区域
	public MyResult findDeptData() {
		List<Level> level = levelService.findAll();
		MyResult myResult = new MyResult();
		myResult.setData(level);
		myResult.setMessage("数据查询完成！");
		return myResult;
	}
}