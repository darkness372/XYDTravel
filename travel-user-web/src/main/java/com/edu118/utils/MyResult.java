package com.edu118.utils;

import java.io.Serializable;

import lombok.Data;


/**
 * 返回页面的结果封装实体类 
 * 
 * <br />信盈达科技 2019年10月24日 下午3:54:55
 * @author MuYu
 */
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

	public MyResult(){}
	
	public MyResult(StatusCode statusCode,String message,Object data){
		this.statusCode = statusCode;
		this.message = message;
		this.data = data;
	}
	
	public static MyResult buildSuccess(Object data) {
		return new MyResult(StatusCode.success, "", data);
	}
	
	public static MyResult buildSuccess(String message,Object data) {
		return new MyResult(StatusCode.success, message, data);
	}
	
	public static MyResult buildError(StatusCode statusCode,String message) {
		return new MyResult(statusCode, message, null);
	}
	/**
	 * 未知操作异常！
	 */
	public static MyResult buildError(String message) {
		return new MyResult(StatusCode.error, message, null);
	}
	/**
	 * 创建一个新的MyResult对象
	 */
	public static MyResult createMyResult(StatusCode statusCode,String message,Object data){
		return new MyResult(statusCode, message, data);
	}
	
	public void clean() {
		this.statusCode = StatusCode.success;
		this.message = "";
		this.data = null;
	}
}
