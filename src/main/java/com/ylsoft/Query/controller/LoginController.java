package com.ylsoft.Query.controller;

import com.ylsoft.Query.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private ILoginService loginService;


    private ModelAndView mv = new ModelAndView();


    //     * 注册的controller
    @RequestMapping("/UserRegister.do")
    public ModelAndView register(@RequestParam(value = "username") String username,
                                 @RequestParam(value = "email") String email,
                                 @RequestParam(value = "password") String password,
                                 @RequestParam(value = "code") String code,
                                 HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取验证码
        HttpSession session = request.getSession();
        String StrCode = (String) session.getAttribute("CHECKCODE_SERVER");
        // 为了防止提交重复的验证码获取后直接删掉
        session.removeAttribute(StrCode);
        // 判断验证码是否正确，这里就不校验参数了，由前台校验
        if (StrCode != null && StrCode.length() != 0 && code.equalsIgnoreCase(StrCode)) {
            String user = loginService.findByUsername(username);
            if (user == null) {
                loginService.register(username, password, email);
                mv.clear();
                mv.setViewName("register-wait");
                return mv;
            } else {
                // 用户名已存在
                mv.clear();
                mv.addObject("CodeErr", "用户名已存在");
                mv.setViewName("register");
                return mv;
            }

        } else {
            // 验证码不正确
            mv.clear();
            mv.addObject("CodeErr", "验证码错误");
            mv.setViewName("register");
            return mv;
        }

    }

    //    * 登录的controller
    @RequestMapping("/UserLogin.do")
    public ModelAndView UserLogin(@RequestParam(value = "username") String username,
                                  @RequestParam(value = "password") String password,
                                  @RequestParam(value = "code") String code,
                                  HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取验证码
        HttpSession session = request.getSession();
        String StrCode = (String) session.getAttribute("CHECKCODE_SERVER");
        // 为了防止提交重复的验证码获取后直接删掉
        session.removeAttribute(StrCode);
        // 判断验证码是否正确，这里就不校验参数了，由前台校验
        if (StrCode != null && StrCode.length() != 0 && code.equalsIgnoreCase(StrCode)) {

            String user = loginService.findByUsername(username);
            String pwd = loginService.findByPassword(password);
            if (user != null && user.length() != 0 && pwd != null && pwd.length() != 0 && user.equals(username) && pwd.equals(password)) {
                mv.clear();
                mv.addObject("user",user);
                session.setAttribute("user",user);
                mv.setViewName("index");
                return mv;
            } else {
                mv.clear();
                mv.addObject("loginErr", "用户名密码错误");
                mv.setViewName("login");
                return mv;
            }

        } else {
            // 验证码不正确
            mv.clear();
            mv.addObject("CodeErr", "验证码错误");
            mv.setViewName("login");
            return mv;
        }
    }


    //    退出登录
    @RequestMapping("/loginOut.do")
    public ModelAndView loginOut(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        mv.clear();
        session.invalidate();
        mv.setViewName("index");
        return mv;
    }

    /**
     * 生成验证码的controller
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkCodeServlet.do")
    public void checkCodeServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");

        //在内存中创建一个长80，宽30的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 80;
        int height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0, 0, width, height);

        //产生4个随机验证码，12Ey
        String checkCode = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("CHECKCODE_SERVER", checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体", Font.BOLD, 24));
        //向图片上写入验证码
        g.drawString(checkCode, 15, 25);

        //将内存中的图片输出到浏览器
        //参数一：图片对象
        //参数二：图片的格式，如PNG,JPG,GIF
        //参数三：图片输出到哪里去
        ImageIO.write(image, "PNG", response.getOutputStream());
    }

    //    * 产生4位随机字符串
    private String getCheckCode() {
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= 4; i++) {
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }

}
