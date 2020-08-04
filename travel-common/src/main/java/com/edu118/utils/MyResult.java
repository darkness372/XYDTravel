package com.edu118.utils;

import java.io.Serializable;

import lombok.Data;

@Data
public class MyResult implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 响应状态码，默认200
	 */
	private StatusCode statusCode = StatusCode.success; 
	/**
	 * 响应信息
	 */
	private String message = ""; // 返回信息消息
	/**
	 * 响应数据
	 */
	private Object data; // 返回数据

	public void clean() {
		this.statusCode = StatusCode.success;
		this.message = "";
		this.data = null;
	}
}