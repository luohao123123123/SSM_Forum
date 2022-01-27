package com.YuezhIforum.dao;

import com.YuezhIforum.bean.Comment;
import com.YuezhIforum.bean.Posts;
import com.YuezhIforum.bean.User;

import java.util.List;

public interface yuezhiforumDao {
    //注册
    int register(User user);
    //登录
    User login(String name);
    //更新头像路径
    void updateImg(String name,String img);
//    查询posts表的所有标签
    List<String> findall();
    //查询posts表的所有公告
    List<Posts> findgonggao();
    //根据poststype查询posts表的所有数据
    List<Posts> type_findall(String postsType,int startid,int overid);
    //根据id查询posts表的所有数据
    List<Posts> id_findall(int postsid) ;
    //根据postsname或者postsbody查询posts表的所有数据
    List<Posts> search(String postsvalue,int startid) ;
    //发表帖子
    int postsPublish(Posts posts);
    //根据name查询用户的id
    int findUseId(String name);
    //根据uid查询posts表的所有数据
    List<Posts> uid_findall(int uid);
    //修改用户name
    int updateUsername(int id,String newvalue);
    //修改用户sex
    int updateUsersex(int id,String newvalue);
    //修改用户age
    int updateUserage(int id,String newvalue) ;
    //修改用户学校
    int updateUserSchool(int id,String newvalue) ;
    //修改用户密码
    int updateUserpassword(int id,String newvalue);
    //根据postsid删除posts
    int deletepots(int postsid) ;
    //posts随机取一条数据
    Posts selectone();
    //posts随机取多条数据
    List<Posts> selectnum() ;
    //查询同一类型的帖子的数量
    int postsTypeCount(String postsType) ;
    //查询搜索到的帖子的数量
    int postsSearchCount(String postsvalue);
    //查询posts所有的数据
    List<Posts> findallPosts() ;
    //根据uid查询用户发表帖子的数量
    int userpostsCount(int uid) ;
    //发表评论
    int commentPublish(Comment comment);
    //根据postsid查询评论
    List<Comment> postsidFindComment(int postsid);
    //根据用户id查询用户发表的评论
    List<Comment> useidFindComment(int uid) ;
    //根据评论id查询posts
    Posts commentidFindPosts(int commentid) ;
    //查询posts的poststop
    int findPostsTop(int postsid);
    //更新posts的poststop
    int updatePostsTop(int newPostsTop,int postsid);
    //根据poststop排序查询所有posts
    List<Posts> topFindPosts() ;
    //根据userid查询user
    User userIdFindUser(int uid) ;
    //查询所有的帖子浏览量
    int sumPostsTop();

}
