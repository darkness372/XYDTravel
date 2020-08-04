package com.edu118.realm;

import java.io.Serializable;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;

public class CustomSessionManager extends DefaultWebSessionManager {
	// 自定义一个请求头属性名称
	private static final String AUTHORIZATION = "xydLoginToke";

	@Override
	protected Serializable getSessionId(ServletRequest request, ServletResponse response) {
		// 获取请求头中的SessionId，也就是token、令牌、通行证
		String sessionId = WebUtils.toHttp(request).getHeader(AUTHORIZATION);
		if (sessionId != null) {
			// 设置到Request域，同时设置SessionId是有效的，如果无效，会报异常
			request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_SOURCE,
					ShiroHttpServletRequest.COOKIE_SESSION_ID_SOURCE);

			request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID, sessionId);
			request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_IS_VALID, Boolean.TRUE);
		}

		return sessionId;
	}
}