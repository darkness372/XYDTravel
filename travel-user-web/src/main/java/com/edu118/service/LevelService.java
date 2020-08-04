package com.edu118.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu118.entity.Level;
import com.edu118.mapper.LevelMapper;

@Service
public class LevelService extends ServiceAdapter<Level, String>{
	@Autowired
	private LevelMapper levelMapper;
	
	@Override
	public List<Level> findAll() {
		return  levelMapper.selectAll();
	}
}