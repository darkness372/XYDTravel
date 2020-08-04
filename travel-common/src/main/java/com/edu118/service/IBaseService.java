package com.edu118.service;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface  IBaseService<T,K> {
	/**
	 * 保存
	 */
	public int insertEntity(T entity);

	/**
	 * 更新
	 */
	public int updateEntity(T entity);

	/**
	 * 删除
	 */
	public int deleteEntity(T entity);

	/**
	 * 查询单个数据
	 */
	public T findById(K key);

	/**
	 * 自定义查询条件
	 * @param flag  查询的标识，不同的标识可以构建不同的查询方式
	 */
	public List<T> findByExample(T entity,String flag);
	
	/**
	 * 查询所有操作
	 */
	public List<T> findAll();

	/**
	 * 模糊分页查询
	 * @param pageable
	 *            分页查询对象
	 * @param param
	 *            查询的其他参数
	 * @return 查询到的数据
	 */
	public List<T> queryPage(Pageable pageable, Object... param);

	/**
	 * 模糊分页查询数据总量
	 * @param pageable
	 *            分页查询对象
	 * @param param
	 *            查询的其他参数
	 * @return 查询到的数据量
	 */
	public long queryPageCount(Pageable pageable, Object... param);

	Map<String, Set<String>> findRolesAndPermissionsByDid(Long did);
}