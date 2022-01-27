package com.YuezhIforum.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class ApiController {
    @RequestMapping(value = "getApi.do")
    public ModelAndView getApi(){
        ModelAndView mv=new ModelAndView("api");
        try {
            URL url=new URL("https://api.1314.cool/words/api.php?return=json");//添加链接
            HttpURLConnection connection=(HttpURLConnection)url.openConnection();//打开链接
            connection.setRequestMethod("GET");//获取方式GET
            connection.connect();//主动发起请求
            InputStream is=connection.getInputStream();//数据的读流
            //字节流转换为字符流
            InputStreamReader reader=new InputStreamReader(is);
            //字符流转换为高级缓冲流
            BufferedReader br=new BufferedReader(reader);
            StringBuffer buffer=new StringBuffer();
            String line=null;
            while ((line=br.readLine())!=null){
                buffer.append(line);
            }

//          {"code":"200","word":"你近视吗?<br>(不近视啊)<br>那你怎么看不出我喜欢你"}
            //解析json数据
            Gson gson=new Gson();
            JsonObject object=gson.fromJson(buffer.toString(),JsonObject.class);
            String word=object.get("word").getAsString();//获取json数据的word字段内容
            mv.addObject("word",word);//发送数据
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "erweima.do",method = RequestMethod.POST)
    public  ModelAndView erweima(String textValue, ModelAndView mv, HttpServletRequest request){
        String url="https://api.uomg.com/api/qrcode?url="+textValue;//创建链接
        try {
            URL url1=new URL(url);
            HttpURLConnection connection= (HttpURLConnection) url1.openConnection();//打开链接
            connection.setRequestMethod("GET"); //设置请求方式
            connection.connect(); //主动打开链接
            InputStream is=connection.getInputStream(); //获取字节流

            String path=request.getServletContext().getRealPath("/imgs"); //获取二维码的存放完整路径
            File file=new File(path,System.currentTimeMillis()+".png"); //生成文件，用当前系统时间当作文件名
            FileOutputStream fos=new FileOutputStream(file);  //边读边写，保存文件
            byte[] b=new byte[1024];
            int count=0;
            while ((count=is.read(b))!=-1){
                fos.write(b,0,count);
                fos.flush();
            }
            fos.close();

            mv.addObject("file",file.getName()); //携带文件名
            mv.setViewName("api1");  //内部转发到前端页面

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
}
