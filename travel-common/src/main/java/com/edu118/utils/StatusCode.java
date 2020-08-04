package com.edu118.utils;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
@Getter
public enum StatusCode {
	/**
	 * 请求成功,200
	 */
	success("请求成功！",200),
	/**
	 * 尚未登陆,401
	 */
	notLogin("尚未登陆！",401),
	/**
	 * 您没有此操作权限,403
	 */
	unauthorized("您没有此操作权限！",403),
	/**
	 * 表单数据验证失败,406
	 */
	validationError("表单数据验证失败！",406),
	/**
	 * 未知操作异常,1000
	 */
	error("未知操作异常！",1000);
	
	int status;
	String message;
	private StatusCode(String message,	int status) {
		this.message = message;
		this.status = status;
	}
}