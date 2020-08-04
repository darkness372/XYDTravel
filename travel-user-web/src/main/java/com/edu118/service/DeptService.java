package com.edu118.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu118.entity.Dept;
import com.edu118.mapper.DeptMapper;

@Service
public class DeptService extends ServiceAdapter<Dept, Long>{
	@Autowired
	private DeptMapper deptMapper;
	
	@Override
	public List<Dept> findAll() {
		return deptMapper.selectAll();
	}
}