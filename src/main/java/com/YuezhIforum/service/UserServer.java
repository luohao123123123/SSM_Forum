package com.YuezhIforum.service;

import com.YuezhIforum.bean.Comment;
import com.YuezhIforum.bean.Posts;
import com.YuezhIforum.bean.User;
import com.YuezhIforum.dao.yuezhiforumDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class UserServer {

    @Autowired
    yuezhiforumDao imp;

    public UserServer() throws SQLException, ClassNotFoundException {

    }

//    注册
    boolean b=false;
    public boolean insert(User user){
        imp.register(user);
        b=true;
        return b;
    }

    //登录
    public User login(String name){
        return imp.login(name);
    }
    //更新头像图片路径
    public void updateImg(String name,String img){
        imp.updateImg(name, img);
    }
    //查询post表的所有公告
    public List<String> findall(){
        return imp.findall();
    }
    //查询post表的所有数据
    public List<Posts> findgonggao(){
        return imp.findgonggao();
    }
    //根据poststype查询posts表的所有公告
    public List<Posts> type_findall(String Typename,int startid,int overid){
        return imp.type_findall(Typename,startid,overid);
    }

    //根据id查询posts表的所有公告
    public List<Posts> id_findall(int id){
        int postsTop=imp.findPostsTop(id);
        imp.updatePostsTop(postsTop+1,id);
        return imp.id_findall(id);
    }

    //搜索
    public List<Posts> search(String postsvalue,int startid){
        return imp.search(postsvalue,startid);
    }

    //发表帖子
    public int postsPublish(Posts posts){
        return imp.postsPublish(posts);
    }

    //根据name查找id
    public  int findUseId(String name){
        return  imp.findUseId(name);
    }

    //根据uid查询posts的数据
    public List<Posts> uid_findall(int uid){
        return imp.uid_findall(uid);
    }
    //修改用户name
    public int updateUsername(int id,String newvalue){
        return imp.updateUsername(id,newvalue);
    }

    //修改用户sex
    public int updateUsersex(int id,String newvalue){
        return imp.updateUsersex(id,newvalue);
    }
    //修改用户age
    public int updateUserage(int id,String newvalue){
        return imp.updateUserage(id,newvalue);
    }
    //修改用户school
    public int updateUserschool(int id,String newvalue){
        return imp.updateUserSchool(id,newvalue);
    }
    //修改用户password
    public int updateUserpassword(int id,String newvalue){
        return imp.updateUserpassword(id,newvalue);
    }
    //根据postsid删除posts
    public  int deletepots(int postsid){
        return imp.deletepots(postsid);
    }
    //随机从posts取一条数据
    public Posts selectone(){
        return imp.selectone();
    }
    //随机从posts取多条数据
    public List<Posts> selectnum(){
        return imp.selectnum();
    }
    //查询同一类型的帖子的数量
    public int postsTypeCount(String postsType){
        return imp.postsTypeCount(postsType);
    }
    //查询搜索到的帖子的数量
    public int postsSearchCount(String postsvalue){
        return imp.postsSearchCount(postsvalue);
    }
    //查询posts所有的数据
    public List<Posts> findallPosts(){
        return imp.findallPosts();
    }
    //根据uid查询用户发表帖子的数量
    public int userpostsCount(int uid){
        return imp.userpostsCount(uid);
    }
    //发表评论
    public int commentPublish(Comment comment){
        return imp.commentPublish(comment);
    }
    //根据postsid查询评论
    public List<Comment> postsidFindComment(int postsid){
        return  imp.postsidFindComment(postsid);
    }
    //根据用户id查询评论
    public List<Comment> useidFindComment(int uid){
        return imp.useidFindComment(uid);
    }

    //根据评论id查询posts
    public Posts commentidFindPosts(int commentid){
        return imp.commentidFindPosts(commentid);
    }
    //查询posts的poststop
    public int findPostsTop(int postsid){
        return imp.findPostsTop(postsid);
    }
    //更新posts的poststop
    public int updatePostsTop(int newPostsTop,int postsid){
        return imp.updatePostsTop(newPostsTop,postsid);
    }
    //根据poststop排序查询所有posts
    public List<Posts> topFindPosts(){
        return imp.topFindPosts();
    }
    //根据userid查询user
    public User userIdFindUser(int uid){
        return  imp.userIdFindUser(uid);
    }
    //查询所有的帖子浏览量
    public int sumPostsTop(){
        return imp.sumPostsTop();
    }
}
