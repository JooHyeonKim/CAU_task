package collection;

import java.util.ArrayList;

public class Ex02 {
	public static void main(String[] args) {
		//String타입의 ArrayList를 생성한 후
		//연예인 5명 이름을 넣어보자
		//이름을 향상된 for문과 일반 for문으로 출력하기
		
		ArrayList<String> celeb = new ArrayList<>();
		
		celeb.add("김태리");
		celeb.add("이지은");
		celeb.add("차은우");
		
		for(String str:celeb) {
			System.out.println(str);
		}
		
		System.out.println();
		
		for(int i=0;i<celeb.size();i++) {
			String name=celeb.get(i);
			System.out.println(i+" : "+name);
		}
	}
}
