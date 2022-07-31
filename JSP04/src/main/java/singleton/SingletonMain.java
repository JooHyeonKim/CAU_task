package singleton;

public class SingletonMain {

	public static void main(String[] args) {
		
//		Singleton sing1 = new Singleton();
//		Singleton sing2 = new Singleton();
		
		Singleton sing1 = Singleton.getInstance();
		Singleton sing2 = Singleton.getInstance();
		
		
		if(sing1 == sing2) {
			System.out.println("같은 객체 입니다.");
		}else {
			System.out.println("다른 객체 입니다.");
		}
		
		
	}

}
