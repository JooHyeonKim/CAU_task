package com.java.jsp;

public class Member {
	
	//아이디, 비밀번호, 이름, 나이 프로퍼티(필드 만들기
	//기본 생성자와 getter, setter 메소드 만들기
	
	private String id;
	private String pwd;
	private String name;
	private int age;
	
	public Member() {}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	

}
