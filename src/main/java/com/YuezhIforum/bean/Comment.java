package com.YuezhIforum.bean;


import java.util.Objects;

public class Comment {

  private int id;
  private String commentValue;
  private  int postsid;
  private int uid;
  private String date;

  public Comment(int id, String commentValue, int postsid, int uid, String date) {
    this.id = id;
    this.commentValue = commentValue;
    this.postsid = postsid;
    this.uid = uid;
    this.date = date;
  }

  public Comment(String commentValue, int postsid, int uid, String date) {
    this.commentValue = commentValue;
    this.postsid = postsid;
    this.uid = uid;
    this.date = date;
  }

  public Comment() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCommentValue() {
    return commentValue;
  }

  public void setCommentValue(String commentValue) {
    this.commentValue = commentValue;
  }

  public int getPostsid() {
    return postsid;
  }

  public void setPostsid(int postsid) {
    this.postsid = postsid;
  }

  public int getUid() {
    return uid;
  }

  public void setUid(int uid) {
    this.uid = uid;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Comment comment = (Comment) o;
    return id == comment.id && postsid == comment.postsid && uid == comment.uid && Objects.equals(commentValue, comment.commentValue) && Objects.equals(date, comment.date);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, commentValue, postsid, uid, date);
  }

  @Override
  public String toString() {
    return "Comment{" +
            "id=" + id +
            ", commentValue='" + commentValue + '\'' +
            ", postsid=" + postsid +
            ", uid=" + uid +
            ", date='" + date + '\'' +
            '}';
  }
}
