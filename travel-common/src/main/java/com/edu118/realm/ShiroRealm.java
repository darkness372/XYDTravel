package com.edu118.realm;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

import com.edu118.entity.Employee;
import com.edu118.service.IEmployeeService;
import com.edu118.utils.MD5Utils;

import lombok.Setter;

@Component
public class ShiroRealm extends AuthorizingRealm{
//	@Autowired
//	private EmployeeService Employeeservice;
	@Setter
	private IEmployeeService employeeService;
	@Override	//登陆验证
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获取用户名和密码
		String eid = (String) token.getPrincipal();
		//密码要进行加密
		String password = new String((char[])token.getCredentials());
		//与数据库中的数据进行比对
		List<Employee> employees = employeeService.findByExample(
				new Employee().setEid(eid).setPassword(MD5Utils.getPassword(password)), 
				"login");
		if (employees.isEmpty()) {
			//说明用户名或者密码错误
			throw new AuthenticationException("您提供的用户名或密码错误！");
		}
		Employee employee = employees.get(0);
		if (employee.getLocked() > 0) {
			throw new LockedAccountException("您当前登陆的用户已被锁定，请联系管理员！");
		}
		
		//直接把emp进行传递
		SecurityUtils.getSubject().getSession().setAttribute("loginEmp", employee);
		return new SimpleAuthenticationInfo(employee,password,getName());
	}
	
	@Override	//授权验证
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Employee emp = (Employee) principals.getPrimaryPrincipal();
		if(emp==null) {
			return null;
		}
		Long did = emp.getDid();
		Map<String, Set<String>> map = employeeService.findRolesAndPermissionsByDid(did);
		SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
		auth.setRoles(map.get("roles"));
		auth.setStringPermissions(map.get("permissions"));
		return auth;
	}
}
