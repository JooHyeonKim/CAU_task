package com.jsp.circle;

public class CircleMemberDTO {
	
	// 계층간 데이터 교환을 위한 자바빈 클래스
	private String name;
	private int age;
	private String phone;
	private String email;
	
	// 기본생성자
	public CircleMemberDTO() {}

	public CircleMemberDTO(String name, int age, String phone, String email) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.email = email;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
