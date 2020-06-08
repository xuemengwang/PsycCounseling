package com.meng.service;

import com.meng.mapper.PsychtestMapper;
import com.meng.mapper.QuestionsMapper;
import com.meng.mapper.TestresultMapper;
import com.meng.model.Psychtest;
import com.meng.model.Questions;
import com.meng.model.Testresult;
import com.meng.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户测试服务类
 *
 * @author wangxuemeng
 * @create 2018-04-11-2:18
 */
@Service
public class TestService {
    @Autowired
    public QuestionsMapper questionsMapper;

    @Autowired
    public TestresultMapper testresultMapper;

    @Autowired
    public PsychtestMapper psychtestMapper;


    //仅用于测试,可删除
    public void test(){
        System.out.println("成功进入测试方法"+questionsMapper);
    }

    //根据用户所选的测试类型,返回该类型下所有的测试(Psychtest)
    public List<Psychtest> GetMultiPsychtestByType(String type) {
        int paramType=1;
        try {
             paramType= Integer.parseInt(type);                                                                         //由于接口中定义的参数为int型,所以此处进行转换
        } catch (NumberFormatException e) {
            e.printStackTrace();                                                                                        //捕获转换错误异常,将paramType置为默认值: 1
            paramType=1;                                                                                                //也可以不写此句
        }
        List<Psychtest> psychtests = psychtestMapper.selectAllByType(paramType);                                      //可能会为空,但是为空的情况可以在前端进行判断,此处不做空处理
        return psychtests;
    }

    //根据testid返回该测试下所有的题目(questions表中的记录)
    public List<Questions> GetMultiQuestionsById(String testid) {                                                       //类似GetMultiPsychtestByType的注释
        int paramTestId=1;
        try {
           paramTestId=Integer.parseInt(testid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Questions> multiQuestionsByTestid = questionsMapper.getMultiQuestionsByTestid(paramTestId);
        return multiQuestionsByTestid;
    }

    /**
     * 根据testid返回该id所对应的psychtest表中记录,该记录存储了test的标题和说明等信息
     * @param testid   psychtestid
     * @return     根据psychtestid查询到的结果
     */
    public Psychtest getPsychtestByPrimaryKey(String testid) {
        int paramTestId=1;
        try {
            paramTestId = Integer.parseInt(testid);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            paramTestId=1;
        }
        Psychtest psychtest = psychtestMapper.selectByPrimaryKey(paramTestId);
        return psychtest;
    }


    /**
     *          存储已登录用户测试的结果,四个参数的共同目的是为了构建一个Testresult对象以存入数据库
     *
     * @param psychtest                     用于获取testid
     * @param session                       用于获取testerid
     * @param score                         用于获取测试得分
     * @param description                   用于获取此得分对应的结果说明
     * @return  如果返回1,则存储成功,否则失败
     */
    public int storeTestResult(Psychtest psychtest,HttpSession session,Integer score,String description){
        int result=0;
        Testresult testresult = new Testresult();                                                                       //构建一个testresult对象 以存储
        User user = (User) session.getAttribute("user");                                                            //从session中获取当前用户
        if (null != user) {                                                                                            //在此判断当前用户是否已经登录
            testresult.setTesterid(user.getId());
            testresult.setConclusion(description);
            testresult.setScore(score);
            testresult.setTestid(psychtest.getId());
            result = testresultMapper.insertSelective(testresult);
        }
        return result;
    }

}
