package com.bdqn.controller;

import com.bdqn.model.Users;
import com.bdqn.pojo.Message;
import com.bdqn.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    /**
     * 用户登录逻辑处理
     * @param u
     * @param request 用于把用户存存到session里面
     * @return
     */
    @RequestMapping("/login")
    public String login(Users u, HttpServletRequest request){
       HttpSession session =  request.getSession();
       Users users = usersService.login(u);
       if (users != null){
           session.setAttribute("usersInfo",users);
           session.removeAttribute("msg");
           return "estateList";
       }else {
           boolean idExits = usersService.isExists(u.getCardId());
           Message message = new Message();
           if (!idExits){
                message.setCode(404);
                message.setMessage("该账号不存在，请先注册");
           }else {
               boolean isDisable = usersService.isDisable(u.getCardId());
               if (isDisable){
                   message.setCode(405);
                   message.setMessage("登录失败，该账号已被冻结");
               }else {
                   message.setCode(406);
                   message.setMessage("登录失败，身份照或密码错误");
               }
           }
           session.setAttribute("msg",message);
           return "redirect:/";
       }

    }

    /**
     * 根据ID去身份证去查找是否被注册
     * @param cardId
     * @return
     */
    @RequestMapping("/isUsed/{id}")
    @ResponseBody
    public Message isUsed(@PathVariable("id") String cardId){
        boolean idExits = usersService.isExists(cardId);
        Message msg = new Message();
        if(idExits){
            msg.setCode(1);
            msg.setMessage("身份证号码已经被注册");
        }else {
            msg.setCode(0);
            msg.setMessage("身份证号可以使用");
        }
        return msg;
    }

    /**
     * 注册用户
     * @param u
     * @param request
     * @param response
     */
    @RequestMapping("/register")
    public void register(Users u, HttpServletRequest request, HttpServletResponse response){
        int row = usersService.register(u);
        if (row == 1){
            request.setAttribute("sucRegister",1);
            try {
                request.getRequestDispatcher("/register.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 退出用户登录
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("users");
        return "redirect:/";
    }
}
