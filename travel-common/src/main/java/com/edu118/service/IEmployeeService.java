package com.edu118.service;

import java.util.Map;
import java.util.Set;

import com.edu118.entity.Employee;

public interface IEmployeeService extends IBaseService<Employee, String>  {
	public Map<String, Set<String>> findRolesAndPermissionsByDid(Long did);
}