package com.edu118.mapper;

import java.util.Set;

import com.edu118.entity.Employee;

import tk.mybatis.mapper.common.Mapper;

public interface EmployeeMapper  extends Mapper<Employee> {
	Set<String> findRolesByEid(Long did);
	Set<String> findPermissionByEid(Long did);
}
