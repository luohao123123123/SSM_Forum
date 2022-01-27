package com.YuezhIforum.bean;


import java.util.Objects;

public class Posts {

  private int id;
  private String postsname;
  private String postsauthor;
  private String postsdate;
  private String postsbody;
  private String postsimg;
  private String poststype;
  private int uid;
  private int poststop;


  public Posts(String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype, int uid, int poststop) {
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
    this.uid = uid;
    this.poststop = poststop;
  }

  public Posts(int id, String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype, int uid, int poststop) {
    this.id = id;
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
    this.uid = uid;
    this.poststop = poststop;
  }

  public Posts() {
  }

  public Posts(int id, String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype) {
    this.id = id;
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
  }

  public Posts(int id, String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype, int uid) {
    this.id = id;
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
    this.uid = uid;
  }

  public Posts(String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype, int uid) {
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
    this.uid = uid;
  }

  public Posts(String postsname, String postsauthor, String postsdate, String postsbody, String postsimg, String poststype) {
    this.postsname = postsname;
    this.postsauthor = postsauthor;
    this.postsdate = postsdate;
    this.postsbody = postsbody;
    this.postsimg = postsimg;
    this.poststype = poststype;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getPostsname() {
    return postsname;
  }

  public void setPostsname(String postsname) {
    this.postsname = postsname;
  }

  public String getPostsauthor() {
    return postsauthor;
  }

  public void setPostsauthor(String postsauthor) {
    this.postsauthor = postsauthor;
  }

  public String getPostsdate() {
    return postsdate;
  }

  public void setPostsdate(String postsdate) {
    this.postsdate = postsdate;
  }

  public String getPostsbody() {
    return postsbody;
  }

  public void setPostsbody(String postsbody) {
    this.postsbody = postsbody;
  }

  public String getPostsimg() {
    return postsimg;
  }

  public void setPostsimg(String postsimg) {
    this.postsimg = postsimg;
  }

  public String getPoststype() {
    return poststype;
  }

  public void setPoststype(String poststype) {
    this.poststype = poststype;
  }

  public int getUid() {
    return uid;
  }

  public void setUid(int uid) {
    this.uid = uid;
  }

  public int getPoststop() {
    return poststop;
  }

  public void setPoststop(int poststop) {
    this.poststop = poststop;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Posts posts = (Posts) o;
    return id == posts.id && uid == posts.uid && poststop == posts.poststop && Objects.equals(postsname, posts.postsname) && Objects.equals(postsauthor, posts.postsauthor) && Objects.equals(postsdate, posts.postsdate) && Objects.equals(postsbody, posts.postsbody) && Objects.equals(postsimg, posts.postsimg) && Objects.equals(poststype, posts.poststype);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, postsname, postsauthor, postsdate, postsbody, postsimg, poststype, uid, poststop);
  }

  @Override
  public String toString() {
    return "Posts{" +
            "id=" + id +
            ", postsname='" + postsname + '\'' +
            ", postsauthor='" + postsauthor + '\'' +
            ", postsdate='" + postsdate + '\'' +
            ", postsbody='" + postsbody + '\'' +
            ", postsimg='" + postsimg + '\'' +
            ", poststype='" + poststype + '\'' +
            ", uid=" + uid +
            ", poststop=" + poststop +
            '}';
  }
}
