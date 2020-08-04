package com.edu118.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class BaseController {
	protected Logger logger = LogManager.getLogger(BaseController.class);
	@Autowired
	protected MessageSource messageSource;

	// 请求参数的验证，统一的处理方法
	@ExceptionHandler(BindException.class)
	public String bindException(BindingResult result, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> errorMsg = new HashMap<>();
		List<FieldError> fieldErrors = result.getFieldErrors();
		for (FieldError fieldError : fieldErrors) {
			errorMsg.put(fieldError.getField() + "Error", fieldError.getDefaultMessage());
		}
		logger.info("验证错误信息：{}", errorMsg);
		// 判断，当前是否为Ajax请求，如果是，通过Response把Map进行JSON序列化返回
		if (isAjaxRequest(request)) {
			writeJson(errorMsg, response);
			return null;
		}
		// 如果不是Ajax请求，就直接跳转回相应的页面。
		String path = request.getServletPath();
		logger.info("验证数据的path：{}", path);
		request.setAttribute("errorMsg", errorMsg);
		String goPage = null;
		try {
			goPage = messageSource.getMessage(path, null, Locale.getDefault());
			logger.info("跳转的页面：{}", goPage);

		} catch (NoSuchMessageException e) {
			request.getSession().setAttribute("errorMessage", "对不起，您当前操作提供的数据有误，请返回检查！");

			response.sendRedirect(getBasePath(request) + "/pages/errorMsg.jsp");
		}
		return goPage;
	}

	private String getBasePath(HttpServletRequest request) {
		// 拼接基本请求路径
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme()).append("://").append(request.getServerName()).append(":")
				.append(request.getServerPort()).append(request.getContextPath());
		return sb.toString();
	}

	/**
	 * 是否是Ajax请求
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String requestedWith = request.getHeader("x-requested-with");
		if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 输出JSON
	 */
	private void writeJson(Map<String, Object> map, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			out = response.getWriter();
			out.write(JSONObject.toJSONString(map, SerializerFeature.WriteNullStringAsEmpty,
					SerializerFeature.DisableCircularReferenceDetect));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}

	/**
	 * 登录认证异常
	 */
	@ExceptionHandler({ UnauthenticatedException.class, AuthenticationException.class })
	public void authenticationException(HttpServletRequest request, HttpServletResponse response) {
		if (isAjaxRequest(request)) {
			// 输出JSON
			Map<String, Object> map = new HashMap<>();
			map.put("status", "666");
			map.put("message", "您尚未登录或登陆已超时，请重新登陆！");
			writeJson(map, response);
		} else {
			try {
				request.getSession().setAttribute("logMsg", "您尚未登录或登陆已超时，请重新登陆！");
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 权限异常
	 */
	@ExceptionHandler({ UnauthorizedException.class, AuthorizationException.class })
	public void authorizationException(HttpServletRequest request, HttpServletResponse response) {
		if (isAjaxRequest(request)) {
			// 输出JSON
			Map<String, Object> map = new HashMap<>();
			map.put("status", "999");
			map.put("message", "对不起，您没有此操作权限！");
			writeJson(map, response);
		} else {
			try {
				request.getSession().setAttribute("errorMessage", "对不起，您没有此操作权限！");
				response.sendRedirect("pages/errorMsg.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
