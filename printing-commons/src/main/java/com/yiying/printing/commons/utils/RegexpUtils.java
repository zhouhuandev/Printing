package com.yiying.printing.commons.utils;

/**
 * 正则表达式工具类
 *
 * @Title:RegexpUtils
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/27 21:45
 */
public class RegexpUtils {
    /**
     * 验证手机号
     */
    public static final String PHONE = "^(13|15|18|17|12|11|14|16|19)\\d{9}$";

    /**
     * 验证邮箱地址
     */
    public static final String EMAIL = "\\w+(\\.\\w)*@\\w+(\\.\\w{2,3}){1,3}";

    /**
     * 验证姓名，可以是中文或英文
     */
    public static final String NAME = "(^[\\u2E80-\\u9FFF]+$)|(^\\w+[\\w\\s]+\\w+$)";


    /**
     * 验证手机号
     *
     * @param phone
     * @return
     */
    public static boolean checkPhone(String phone) {
        return phone.matches(PHONE);
    }

    /**
     * 验证邮箱
     *
     * @param email
     * @return
     */
    public static boolean checkEmail(String email) {
        return email.matches(EMAIL);
    }

    /**
     * 验证姓名
     * @param name
     * @return
     */
    public static boolean checkName(String name){
        return name.matches(NAME);
    }
}
