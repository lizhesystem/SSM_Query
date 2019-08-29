package com.ylsoft.Query.controller;


import com.github.pagehelper.PageInfo;
import com.ylsoft.Query.domain.User;
import com.ylsoft.Query.service.IQueryUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/list")
public class DataListController {

    @Autowired
    private IQueryUserService iqueryUserService;

    private ModelAndView mv = new ModelAndView();

    //    查询所有数据
//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll(@RequestParam(value = "page", required = true, defaultValue = "1") Integer page,
//                                @RequestParam(value = "size", required = true, defaultValue = "5") Integer size,
//                                @RequestParam Map<String, String> param
//    ) {
//        List<User> uList = iqueryUserService.findAll(page, size);
//        PageInfo pageInfo = new PageInfo(uList);
//        mv.addObject("PageInfo", pageInfo);
//        mv.setViewName("list");
//        return mv;
//    }

    //    新增user
    @RequestMapping("/addUser.do")
    public String addUser(User user) {
        iqueryUserService.addUser(user);
        return "redirect:findUserMessage.do";
    }

    //    查找信息跳转休息页面
    @RequestMapping("/editUser.do")
    public ModelAndView editUser(String id) {
        User user = iqueryUserService.findByUser(id);
        mv.addObject("user", user);
        mv.setViewName("edit");
        return mv;
    }

    //        修改用户
    @RequestMapping("/Update.do")
    public String Update(User user) {
        iqueryUserService.updateUser(user);
        return "redirect:findUserMessage.do";
    }

    //  删除
    @RequestMapping("/delUser.do")
    public String delUser(String id) {
        iqueryUserService.delUser(id);
        return "redirect:findUserMessage.do";
    }

    // 删除选中的用户
    @RequestMapping("/delSelectUser.do")
    public String delSelectUser(@RequestParam(value = "uid") String[] uid) {
        iqueryUserService.delSelectUser(uid);
        return "redirect:findUserMessage.do";
    }

    // 模糊筛选用户

    @RequestMapping("/findUserMessage.do")
    public ModelAndView findUserMessage(@RequestParam(value = "page", required = true, defaultValue = "1") Integer page,
                                        @RequestParam(value = "size", required = true, defaultValue = "5") Integer size,
                                        @RequestParam Map<String, String> param) {
        List<User> list = iqueryUserService.findUserMessage(page, size, param);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("inputPara", param);
        mv.addObject("PageInfo", pageInfo);
        mv.setViewName("list");
        return mv;
    }
}
