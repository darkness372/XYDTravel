package com.edu118.utils;

import java.util.Base64;

public class MD5Utils {
	private static final String SEED  = "xyd_muyu" ;		//盐  密钥
	private static final int NE_NUM = 5 ;	
	private MD5Utils() {}
	private static String createSeed() {	
		String str = SEED ;
		for (int x = 0 ; x < NE_NUM ; x ++) {
			str = Base64.getEncoder().encodeToString(str.getBytes()) ;
		}
		return str ;
	}
	public static String getPassword(String password) {
		MD5Code md5 = new MD5Code() ;
		String pass = "{" + password + ":" + createSeed() + "}";
		for (int x = 0 ; x < NE_NUM ; x ++) {
			pass = md5.getMD5ofStr(pass) ;
		}
		return pass ; 
	}
	
	public static void main(String[] args) {
		System.out.println(getPassword("123456"));//71DB941C58893A66F9568F223763DC46
	}
}
