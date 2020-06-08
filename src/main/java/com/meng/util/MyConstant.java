package com.meng.util;

/**
 * @description: 项目中的一些常量
 * @author: wangxuemeng
 * @create: 2018-04-03 19:30
 **/

public class MyConstant {

//    用户角色
    public static byte ROLE_SUPER_ADMIN = 0;
    public static byte ROLE_ADMIN = 1;
    public static byte ROLE_EXPERT = 2;
    public static byte ROLE_USER = 3;
//    用户擅长领域  '全部','婚恋','健康','两性','职场','教育','性格','其他'
    public static byte FIELD_ALL = 0;
    public static byte FIELD_MARRIAGE = 1;
    public static byte FIELD_HEALTH = 2;
    public static byte FIELD_SEX = 3;
    public static byte FIELD_WORK = 4;
    public static byte FIELD_EDU = 5;
    public static byte FIELD_NATURE = 6;
    public static byte FIELD_OTHER = 7;
//    文章领域  '全部','婚恋','健康','两性','职场','教育','性格','科普'
    public static byte ESSAY_FIELD_ALL = 0;
    public static byte ESSAY_FIELD_MARRIAGE = 1;
    public static byte ESSAY_FIELD_HEALTH = 2;
    public static byte ESSAY_FIELD_SEX = 3;
    public static byte ESSAY_FIELD_WORK = 4;
    public static byte ESSAY_FIELD_EDU = 5;
    public static byte ESSAY_FIELD_NATURE = 6;
    public static byte ESSAY_FIELD_OTHER = 7;
//  测试题目所属的类型,对应数据库psythtest表的type<tinyint>字段,暂未使用
    public static byte TYPEE_HEALTH=1;
    public static byte TYPE_MNATURE=2;
    public static byte TYPE_ABILITY=3;
    public static byte TYPE_MARRIAGE=4;
    public static byte TYPE_RELATIONSHIP=5;
    public static byte TYPE_SEX=6;
    public static byte TYPE_WORK=7;
    public static byte TYPE_PARENT_CHILD=8;
//    首页显示推荐专家数量
    public static int PAGE_LENGTH_EXPERT_INDEX = 14;
//    专家列表页每页数量
    public static int PAGE_LENGTH_EXPERT_LIST = 10;
//    案例首页显示案例的数量
    public static int PAGE_LENGTH_CASE_INDEX = 5;
//    案例例表页每页数量
    public static int PAGE_LENGTH_CASE_LIST = 10;
//    个人中心我的咨询记录每页显示记录数
    public static int PAGE_LENGTH_UC_CASE_LIST = 4;
//    文章列表页每页数量
    public static int PAGE_LENGTH_ESSAY_LIST = 10;
//    感恩墙列表页每页数量
    public static int PAGE_LENGTH_GRATWALL_LIST = 10;

}
