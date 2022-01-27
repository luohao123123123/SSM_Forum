package com.YuezhIforum.bean;


import java.util.Objects;

public class User {

  private int id;
  private String name;
  private String password;
  private String sex;
  private int age;
  private String school;
  private int zhiding;
  private String img;

  public User() {
  }

  public User(int id, String name, String password, String sex, int age, String school, int zhiding, String img) {
    this.id = id;
    this.name = name;
    this.password = password;
    this.sex = sex;
    this.age = age;
    this.school = school;
    this.zhiding = zhiding;
    this.img = img;
  }

  public User(String name, String password, String sex, int age, String school, int zhiding, String img) {
    this.name = name;
    this.password = password;
    this.sex = sex;
    this.age = age;
    this.school = school;
    this.zhiding = zhiding;
    this.img = img;
  }

  public User(String name, String password, String sex, int age, String school) {
    this.name = name;
    this.password = password;
    this.sex = sex;
    this.age = age;
    this.school = school;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }

  public int getZhiding() {
    return zhiding;
  }

  public void setZhiding(int zhiding) {
    this.zhiding = zhiding;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    User user = (User) o;
    return id == user.id && age == user.age && zhiding == user.zhiding && Objects.equals(name, user.name) && Objects.equals(password, user.password) && Objects.equals(sex, user.sex) && Objects.equals(school, user.school) && Objects.equals(img, user.img);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, password, sex, age, school, zhiding, img);
  }

  @Override
  public String toString() {
    return "User{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", password='" + password + '\'' +
            ", sex='" + sex + '\'' +
            ", age=" + age +
            ", school='" + school + '\'' +
            ", zhiding=" + zhiding +
            ", img='" + img + '\'' +
            '}';
  }
}
