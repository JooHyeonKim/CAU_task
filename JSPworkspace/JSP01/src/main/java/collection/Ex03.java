package collection;

import java.util.*;

//Member 클래스를 만든다.
//필드는 String name; String id; String pw; 로 하고
//외부접근금지가 되게 한다.(private)
//생성자의 매개변수로 매개값을 받아 필드 초기화를 한다.
//필드를 사용할 수 있게 필드에 대한 getter/setter 메소드를 만든다.
//필드를 출력해주는 profile 메소드를 만든다.

class Member{
	private String name;
	
	private String id;
	private String pw;
	public Member(String name, String id, String pw) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public void profile() {
		System.out.println("--------------------");
		System.out.println(name+"님의 프로필!");
		System.out.println(name+"님의 아이디: "+id);
		System.out.println(name+"님의 비밀번호: "+pw);
		System.out.println("--------------------");
	}
	
}

public class Ex03 {

	public static void main(String[] args) {
		
		// Member 타입의 ArrayList를 생성한 후 
		// Scanner로 2명의 회원 이름, 아이디, 비밀번호를 입력받아	
		// ArrayList의 각 요소에 저장한다.
		// Iterator로 회원의 이름, 아이디, 비밀번호 출력하기
		
		ArrayList<Member> list=new ArrayList<>();
		
		Scanner scan=new Scanner(System.in);
		
		for(int i=0;i<2;i++) {
			
			System.out.print(i+1+"번째 회원의 이름 : ");
			String name=scan.next();
			
			System.out.print(i+1+"번째 회원의 아이디 : ");
			String id=scan.next();
			
			System.out.print(i+1+"번째 회원의 비밀번호 : ");
			String pw=scan.next();
			
			list.add(new Member(name, id, pw));
		}
		
		Iterator<Member> iter=list.iterator();
		while(iter.hasNext()) {
			Member member=iter.next();
			member.profile();
		}
		
	}

}
