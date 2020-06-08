package com.meng.controller;

import com.meng.model.Psychtest;
import com.meng.model.Questions;
import com.meng.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @description: 心理测试相关
 * @author: wangxuemeng
 * @create: 2018-04-05 23:34
 * @modifier wxm   2018-04-10 13:36
 **/

@Controller
@RequestMapping("test")
public class TestController {

    @Autowired
    private TestService testService;


    /**
     * type为测试的类型,如果前端没有传递,则默认为1,即:"健康"
     * @param type
     * @return
     */
    @RequestMapping({"/index/{type}"})
    public ModelAndView Type(@PathVariable String type){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/index");                                                                                 //通过viewname设置jsp的位置,并渲染
        List<Psychtest> psychtests = testService.GetMultiPsychtestByType(type);                                        //根据前端传来的type参数,在数据库中查询该type所对应的试题库
        mav.addObject("psythtests", psychtests);                                                       //将查询结果添加仅ModelAndView中,以在前端渲染数据
        mav.addObject("type", Integer.parseInt(type));                                                                    //将此时用户算选择的测试类型返回给前端,可能会用到
        return mav;
    }

//    @RequestMapping({"/index/{type}"})
//    public String Type2(@PathVariable String type, Model model){
//        List<Psychtest> psychtests = testService.GetMultiPsychtestByType(type);                                        //根据前端传来的type参数,在数据库中查询该type所对应的试题库
//        model.addAttribute("psythtests", psychtests);                                                       //将查询结果添加仅ModelAndView中,以在前端渲染数据
//        model.addAttribute("type", Integer.parseInt(type));                                                                    //将此时用户算选择的测试类型返回给前端,可能会用到
//        return "test/index";
//    }


    //返回测试界面
    @RequestMapping({"dotest"})
    public ModelAndView doTest(@RequestParam("testid")String testid,HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/test/test_info");                                                                          //设置视图名
        List<Questions> questions = testService.GetMultiQuestionsById(testid);                                        //查询该testid所有的questions
        Psychtest psychtest = testService.getPsychtestByPrimaryKey(testid);                                           //根据testid获取psychtest
        String requireTime = "0";                                                                                       //测试大约需要requiretime分钟
        if (null != questions) {                                                                                        //如果此试题下的题目不为空,则根据题目的数量计算完成此测试所需要的时间
            int count = questions.size();
            requireTime = String.valueOf(Math.round(count * 0.2));
            if (requireTime.equals("0")) {                                                                             //题目较少,导致需要的时间只能显示为0分钟,此处改为1分钟
                requireTime = "1";
            }
        }
        HttpSession session = request.getSession();                                                                     //将psychtest的信息存入session
        session.setAttribute("psychtest", psychtest);                                                              //显示测试结果界面(testresult)需要此值,所以存入session中,不用在传给前端,然后再传回来~
        mav.addObject("questions", questions);                                                         //将数据加入到返回值中
        mav.addObject("psychtest", psychtest);                                                         //测试试题的id
        mav.addObject("testid", testid);                                                                //testid加入到返回值中,暂未使用,之后可能会用到
        mav.addObject("requiretime", requireTime);
        return mav;
    }


    /**
     * 用户提交测试答案到此,在此计算用户的得分,以及返回此得分所对应的说明结果
     * @param request 访问该页面的request,request中包含所有的请求信息,包括请求的地址,请求的方式,请求的参数等等
     * @return
     */
    @RequestMapping("testresult")
    public ModelAndView testResult(HttpServletRequest request,@RequestParam("testId") int testId) {
        ModelAndView mav = new ModelAndView("/test/test_result");                                       //在创建ModelAndView的时候,传入参数指定ViewName
        int resultScore = 0;                                                                                            //用户的测试结果
        String description = "";                                                                                        //用户测试结果所对应的结果分析
        Map<String, String[]> parameterMap = request.getParameterMap();                                                 //从request获取所有的请求参数,并用map保存下来
        Set keySet = parameterMap.entrySet();                                                                           //转为Set类型,Set与Map的区别:Set中的key不能存在重复,如果重复则仅保留第一个.所以可以有效的去除map中重复的请求参数
        int sumScore=0;                                                                                                 //计算用户的总分
        for (Iterator itr = keySet.iterator(); itr.hasNext(); ) {                                                       //迭代,逐个取出Set中key/value
            Map.Entry me = (Map.Entry) itr.next();                                                                      //获取下一个迭代子,如果是第一次执行next方法,则获取第一个迭代子
            Object ok = me.getKey();                                                                                    //获取key,前端input标签中的name属性所对应的值,但是获取此值对功能实现并没有什么帮助,也可以不获取
            Object ov = me.getValue();                                                                                  //获取当前迭代子的value,也就是前端传来的一个个数值,如: 90   30    60 等
            String[] value = new String[1];
            if (ov instanceof String[]) {                                                                             //ov的值可能为数组的原因:前端可能有多选框,如果选择在多选框中选择了多个值,那么此处的的value就会是一个String数组
                value = (String[]) ov;
            }else{
                value[0]=ov.toString();
            }
            sumScore+=Integer.parseInt(value[0]);                                                                       //前端没有复选框,所有value中只有一个值
//            for (String index : value) {
//                sumScore += Integer.valueOf(index);
//            }
        }
        resultScore = Math.round(sumScore / (keySet.size()));                                                           //总分除以问题的个数,得到一个大于0  小于 100 的整数

        HttpSession session = request.getSession();                                                                      //request中获取session
        Psychtest psychtest = (Psychtest) session.getAttribute("psychtest");                                       //从session中获取psychtest
        if(resultScore>=90&&resultScore<=100){                                                                          //简单实现,之后更改
            description = psychtest.getLevelPerfect();
        }else if(resultScore>=60&&resultScore<90){
            description = psychtest.getLevelHeight();
        } else if (resultScore >= 40 && resultScore < 60) {
            description = psychtest.getLevelMid();
        } else if (resultScore >= 20 && resultScore < 40) {
            description = psychtest.getLevelMid();
        } else if (resultScore >= 0 && resultScore < 20) {
            description = psychtest.getLevelLow();
        }else{
            description = "分数异常";
        }
        Date currentDate = new Date();                                                                                  //获取当前时间,即用户的测试时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");                   //格式化当前时间
        String currentDateString = simpleDateFormat.format(currentDate);
        mav.addObject("resultScore", resultScore);                                                     //将前端所需要的数据加到Model中
        mav.addObject("description", description);
        mav.addObject("psychtest", psychtest);
        mav.addObject("testId", testId);
        mav.addObject("currentDate", currentDateString);

         // 因为系统中没有查看用户测试记录的模块,所以此处将测试结果存储数据库的逻辑注释掉
        /*
        int dbResult=0;
        if (null !=session.getAttribute("user")) {                                                                      //后端判断当前用户是否已经登录,如果为空,则表示当前用户未登录
            dbResult  = testService.storeTestResult(psychtest, session, resultScore, description);                      //将测试结果保存到testresult表中
            if (dbResult != 1) {                                                                                        //保存结果为:1 ,表示保存成功,否则失败
                mav.addObject("msg", "测试结果存储失败了");
            }else{
                mav.addObject("msg","测试结果存储成功了");
            }
        }else{                                                                                                          //当前用户未登录
            mav.addObject("msg", "当前用户未登录,故不存储");
        }
        */
        return mav;
    }
//    @RequestMapping({"/"})
//    public String index(){                                                                                              //测试使用,可删除
//        testService.test();
//        return "test/index";
//    }

}
