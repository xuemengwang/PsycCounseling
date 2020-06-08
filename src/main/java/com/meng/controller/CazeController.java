package com.meng.controller;

import com.meng.model.Caze;
import com.meng.model.PageBean;
import com.meng.model.Problem;
import com.meng.model.Reply;
import com.meng.service.CazeService;
import com.meng.service.ProblemService;
import com.meng.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @description: 与案例相关
 * @author: wangxuemeng
 * @create: 2018-04-05 13:30
 **/

@Controller
@RequestMapping("case")
public class CazeController {

    @Autowired
    CazeService cazeService;
    @Autowired
    ProblemService problemService;
    @Autowired
    ReplyService replyService;

    @RequestMapping({"/", "index"})
    public String index(Model model) {
        List<Caze> list = cazeService.selectLastSeveralCaze();
        model.addAttribute("cases", list);
        return "case/index";
    }

    @RequestMapping("list/{pageId}")
    public String list(@PathVariable int pageId, Model model) {

        PageBean<Caze> pageBean = cazeService.getCazeByPageIdAndOrderByTime(pageId);
        model.addAttribute("pageBean", pageBean);
        return "case/list";
    }

    @RequestMapping("{cazeId}")
    public String detail(@PathVariable int cazeId, Model model) {
        //获取案件
        Caze caze = cazeService.getCazeById(cazeId);
        //获取案件相关提问
        List<Problem> problemList = problemService.getByCaseId(cazeId);
        //获取案件中提问的相关回答并顺带获取最后一个提问的id，为之后添加回复辅助
        int lastProblemId = 0;
        for (Problem problem : problemList) {
            Reply reply = replyService.getReplyByProblemId(problem.getId());
            problem.setReply(reply);
            lastProblemId = problem.getId();
        }
        model.addAttribute("caze", caze);
        model.addAttribute("problemList", problemList);
        model.addAttribute("lastProblemId", lastProblemId);
        return "case/detail";
    }

    @RequestMapping("{cazeId}/addProblem")
    @ResponseBody
    public void addProblem(@PathVariable int cazeId, String content) {
        problemService.addNewProblem(cazeId,content);
    }


    @RequestMapping("{cazeId}/reply")
    @ResponseBody
    public void reply(String content,Integer problemId) {
        replyService.addNewReply(problemId,content);
    }

    @RequestMapping("{cazeId}/receive")
    @ResponseBody
    public void receive(@PathVariable int cazeId,Integer userId) {
        cazeService.addReplyUser(cazeId,userId);
    }
}
