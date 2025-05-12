package day01;

public class Welcome {
	public static void main(String[] args) { // public : 접근제어자(모든 곳에서 접근 가능) static : 정적 메서드(클래스 레벨에서 호출가능) 
											 // void : 반환타입(값을 반환하지 않음) main : 메서드(프로그램 시작을 위한 메서드)
		System.out.println("Welcome to my house");
		System.out.println("\033[94m" + "Welcome to my house" + "\033[0m");
		System.out.print("Welcome to your house");
		System.out.print("Welcome to his house");
	}
}
