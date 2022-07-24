package com.java.jsp;

public class Student {
	
	//자바빈 규약
	//1. 빈이 패키지화 되어 있어야 한다.
	//2. 기본생성자를 반드시 가지고 있어야 한다.
	//3. 멤버변수(필드) 접근제한자는 private으로 선언한다.
	//4. 멤버변수에 접근하기 위한 public 접근제한자인
	//	getter / setter 메소드가 존재해야 한다.
	
	private int studentID;
	private String name;
	private int age;
	private int grade;
	
	//기본생성자
	public Student() {}
	
	
	//	getter / setter 메소드
	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	//getter / setter 메소드
	
	
	

}
