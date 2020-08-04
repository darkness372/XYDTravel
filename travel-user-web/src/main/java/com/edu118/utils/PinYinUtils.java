package com.edu118.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinYinUtils {
	/**
	 * 得到中文首字母
	 * @param str需要转化的中文字符串
	 */
	public static String getPinYinHeadChar(String chines) {
		chines = cleanChar(chines);
		String pinyinName = "";
		char[] nameChar = chines.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < nameChar.length; i++) {
			if (nameChar[i] > 128) {
				try {
					pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)[0].charAt(0);
				} catch (BadHanyuPinyinOutputFormatCombination e) {
					e.printStackTrace();
				}
			} else {
				pinyinName += nameChar[i];
			}
		}
		return pinyinName;
	}
	/**
	 * 清理特殊字符以便得到
	 * @param chines
	 * @return
	 */
	public static String cleanChar(String chines) {
		chines = chines.replaceAll("[\\p{Punct}\\p{Space}]+", ""); // 正则去掉所有字符操作
		// 正则表达式去掉所有中文的特殊符号
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}<>《》【】‘；：”“’。，、？]";
		Pattern pattern = Pattern.compile(regEx);
		Matcher matcher = pattern.matcher(chines);
		chines = matcher.replaceAll("").trim();
		return chines;
	}
}