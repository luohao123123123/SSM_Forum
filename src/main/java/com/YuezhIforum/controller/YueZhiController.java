package com.YuezhIforum.controller;

import com.YuezhIforum.bean.Comment;
import com.YuezhIforum.bean.Posts;
import com.YuezhIforum.bean.User;
import com.YuezhIforum.service.UserServer;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Controller
public class YueZhiController {
    @Autowired
    UserServer server;

    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    public String reigister(User user, HttpServletRequest request) throws SQLException{
        if (server.insert(user)) {
            request.getSession().setAttribute("Sessionname", user.getName());
            request.getSession().setMaxInactiveInterval(60*60*24);
            return "login";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public void login(String getNameValue,Writer out,Gson gson) throws SQLException{
        User u = server.login(getNameValue);
        if (u == null) {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (getNameValue.equals(u.getName())) {
            try {
                out.write(gson.toJson("yes"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    @RequestMapping(value = "login1.do",method = RequestMethod.POST)
    public void logintohome(String getNameValue, String getPsValue, Writer out,Gson gson) throws SQLException {
        User user=server.login(getNameValue);
        if(user==null){
            try {
                out.write(gson.toJson("???????????????"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else if(getPsValue.equals(user.getPassword())){
            try {
                out.write(gson.toJson("????????????"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {

                out.write(gson.toJson("????????????"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "login2.do",method = RequestMethod.POST)
    public String logintohome(String name, String password,HttpServletRequest request) throws SQLException {
        User user=server.login(name);
        if(user==null){
           return "login";
        }
        else if(password.equals(user.getPassword())){
            //?????????home????????????name??????
            request.getSession().setAttribute("name",name);
            request.getSession().setAttribute("server",server);
          return "home";
        }
        else {
           return "login";
        }
    }

    @RequestMapping(value = "imgs.do",method = RequestMethod.POST)
    public void getImgs(@RequestParam("imgs") MultipartFile file,@RequestParam("getnamevalue") String name,HttpServletRequest request,Writer out) throws SQLException, ClassNotFoundException, IOException {
        //?????????????????????
        ServletContext context=request.getServletContext();
        //imgs???????????????
        String dirpath=context.getRealPath("/imgs");
        System.out.println(dirpath);
        System.out.println("file"+file.getOriginalFilename());
        server.updateImg(name,file.getOriginalFilename());
        //??????????????????
        File f=new File(dirpath, Objects.requireNonNull(file.getOriginalFilename()));
        try {
            //????????????
            file.transferTo(f);
            //???????????????0
            Gson gson=new Gson();
            HashMap hm=new HashMap();
            hm.put("ReturnValue3",file.getOriginalFilename());
            out.write(gson.toJson(hm));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //????????????
    @RequestMapping(value = "out.do",method =RequestMethod.GET)
    public String OUT(HttpServletRequest request){
      request.getSession().removeAttribute("name");
        return "home";
    }

    @RequestMapping(value = "postsPublish.do",method = RequestMethod.POST)
    public String postsPublish(@RequestParam("postsimg")CommonsMultipartFile file, String postsname,String postsbody,String poststype,HttpServletRequest request,Writer out,Gson gson) throws SQLException {
        if (file.getSize() == 0) {
            //??????????????????????????????
            String name= (String) request.getSession().getAttribute("name");
            int id=server.findUseId(name);
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=sf.format(new Date());
            Posts posts=new Posts(postsname,name,date,postsbody,"?????????",poststype,id);
            int i=server.postsPublish(posts);
            if(i>0){
                try {
                    out.write(gson.toJson("yes"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return "PostPublishing";
            }
            else {
                try {
                    out.write(gson.toJson("no"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return "PostPublishing";
            }
        }
        else {
            //??????????????????
            ServletContext context = request.getServletContext();
            String dirpath = context.getRealPath("/imgs");
            File f = new File(dirpath, Objects.requireNonNull(file.getOriginalFilename()));
            try {
                file.transferTo(f);
            } catch (IOException e) {
                e.printStackTrace();
            }

            //??????????????????????????????
            String name= (String) request.getSession().getAttribute("name");
            int id=server.findUseId(name);
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=sf.format(new Date());
            Posts posts=new Posts(postsname,name,date,postsbody,file.getOriginalFilename(),poststype,id);
            int i=server.postsPublish(posts);
            if(i>0){
                try {
                    out.write(gson.toJson("yes"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return "PostPublishing";
            }
            else {
                try {
                    out.write(gson.toJson("no"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return "PostPublishing";
            }
        }
    }

    @RequestMapping(value = "updatename.do",method = RequestMethod.POST)
    public void updatename(String namevalue, int idvalue, Writer out, Gson gson, HttpServletResponse response) throws SQLException, IOException {
        int i=server.updateUsername(idvalue,namevalue);
        if(i>0){
            try {
                out.write(gson.toJson(namevalue));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "updatesex.do",method = RequestMethod.POST)
    public void updatesex(String sexvalue, int idvalue, Writer out, Gson gson, HttpServletResponse response) throws SQLException, IOException {
        int i=server.updateUsersex(idvalue,sexvalue);
        if(i>0){
            try {
                out.write(gson.toJson(sexvalue));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    @RequestMapping(value = "updateage.do",method = RequestMethod.POST)
    public void updateage(String agevalue, int idvalue, Writer out, Gson gson, HttpServletResponse response) throws SQLException, IOException {
        int i=server.updateUserage(idvalue,agevalue);
        if(i>0){
            try {
                out.write(gson.toJson(agevalue));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    @RequestMapping(value = "updateschool.do",method = RequestMethod.POST)
    public void updateschool(String schoolvalue, int idvalue, Writer out, Gson gson, HttpServletResponse response) throws SQLException, IOException {
        int i=server.updateUserschool(idvalue,schoolvalue);
        if(i>0){
            try {
                out.write(gson.toJson(schoolvalue));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "updatepassword.do",method = RequestMethod.POST)
    public void updatepassword(String passwordvalue, int idvalue, Writer out, Gson gson, HttpServletResponse response) throws SQLException, IOException {
        int i=server.updateUserpassword(idvalue,passwordvalue);
        if(i>0){
            try {
                out.write(gson.toJson(passwordvalue));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "deleteposts.do",method = RequestMethod.GET)
    public String deleteposts(Writer out,int postsid) throws SQLException {
        int i=server.deletepots(postsid);
        return "userPosts";
    }

    //????????????
    @RequestMapping(value = "commentPublish.do",method = RequestMethod.POST)
    public void commentPublish(@RequestParam("commentValue") String commentValue,@RequestParam("postsid") int postsid,@RequestParam("username") String username, Writer out,Gson gson) throws SQLException {
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date=sf.format(new Date());
        int uid=server.findUseId(username);
        Comment comment=new Comment(commentValue,postsid,uid,date);
        int i=server.commentPublish(comment);
        if(i>0){
            try {
                out.write(gson.toJson("ok"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                out.write(gson.toJson("no"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "topsum.do",method = RequestMethod.POST)
    public void topsum(Writer out,Gson gson) throws  IOException {
        int sum=server.sumPostsTop();
        out.write(gson.toJson(sum));
    }
}

