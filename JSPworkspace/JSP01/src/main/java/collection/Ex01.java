package collection;

import java.util.ArrayList;

public class Ex01 {

	public static void main(String[] args) {
		
		ArrayList<String> list =new ArrayList<>();
		
		//List : 데이터를 일렬로 늘어놓은 자료구조
		//데이터의 중복허용, 순서중요
		
		list.add("홍길동");
		list.add("성춘향");
		list.add("이몽룡");
		
		System.out.println("총 객체 수 : "+ list.size());
		
		
		//향상된 for문
		for(String str : list) {
			System.out.println(str);
		}
		
		System.out.println();
		String str1=list.get(1);
		System.out.println("index 1:"+ str1);
		
		for(int i=0;i<list.size();i++) {
			String name= list.get(i);
			System.out.println(i+":"+name);
		}
		
		System.out.println();
		
		list.remove(1);
		list.remove("홍길동");
		
		System.out.println("총 객체 수 : "+ list.size());
		
		list.clear(); //저장된 모든 객체를 삭제한다.
		
		System.out.println(list.isEmpty());
		
	}

}
