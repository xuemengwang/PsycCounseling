package com.meng.util;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * @description: 日期转换器
 * @author: wangxuemeng
 * @create: 2018-04-02 21:39
 **/

//需要实现Converter接口，这里是将String类型转换成Date类型
public class CustomDateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        try {
            //将日期串转成日期类型(格式是yyyy-MM-dd),转成直接返回
            return new SimpleDateFormat("yyyy-MM-dd").parse(source);
        } catch (ParseException e) {
            //标准格式的日期字符串(Tue Apr 03 00:00:00 CST 2018)转换为date
            try {
                return new SimpleDateFormat("EEE MMM d K:m:s zzz yyyy",Locale.ENGLISH).parse(source);
            }catch (Exception e1){
                e1.printStackTrace();
            }
        }
        return null;
    }
}