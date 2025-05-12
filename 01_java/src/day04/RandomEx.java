package day04;

import java.util.Random;

import util.MyUtil;

public class RandomEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyUtil.p("Random Example");
		
		Random rd = new Random();
		
		// Random Number Test
		MyUtil.p("nextInt() : " + rd.nextInt());
		MyUtil.p("nextInt(100) : " + rd.nextInt(100));
		MyUtil.p("nextFloat() : " + rd.nextFloat());
		MyUtil.p("nextDouble() : " + rd.nextDouble());
		
		// nextInt(N) : 0부터 N-1까지 나오는 것을 이용하여
		// 주사위 범위(1~6) 내 숫자가 나오도록 만들어보세요
		int result1 = rd.nextInt(1,7); // 1~6
		int result2 = rd.nextInt(6) +1; // 1~6
		MyUtil.p("주사위 숫자 : " + result1);
		MyUtil.p("주사위 숫자 : " + result2);
		
		// Random Alphabet(A-Z)
		// 생각해볼 것, 'A'는 10진수 65
		char rchar1 = (char)(rd.nextInt(26)+65); // int의 범위가 char의 범위보다 넓으므로 강제로 char로 지정해줘야 한다
		char rchar2 = (char)(rd.nextInt(65,91));
		MyUtil.p("A-Z 중 하나 : " + rchar1);
		MyUtil.p("A-Z 중 하나 : " + rchar2);
		
		// 대소문자중 Random Alphabet(A-Z 또는 a-z) 
		// 생각해볼 것, 'A' 65, 'a' 97
		// 과연 대소문자 중 하나는 어떻게 구현할까? (A-Z : 65~90 , a-z : 97~122)
		
		// rchar = rd.nextInt(26) + 65 아니면 97
		char rchar4 =(char)(rd.nextInt(26) + 65 + 32*rd.nextInt(2));
		MyUtil.p("A-Z or a-z 중 하나 : " + rchar4);
		// 문자를 표시하는 방식(ASCII)
		// A : 65(0x41), a : 97(0x61)
		// 0 : 48(0x30)
		// bit : 0 or 1, byte = 8 bit, 010101001
		// bit를 원자라고 인식, byte를 분자라고 인식
		
		
	}

}
