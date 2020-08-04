package com.edu118.service;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ServiceAdapter <T,K> implements IBaseService<T,K> {

	@Override
	public int insertEntity(T entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEntity(T entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEntity(T entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public T findById(K key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> findByExample(T entity, String flag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> queryPage(Pageable pageable, Object... param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long queryPageCount(Pageable pageable, Object... param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Set<String>> findRolesAndPermissionsByDid(Long did) {
		// TODO Auto-generated method stub
		return null;
	}

}
