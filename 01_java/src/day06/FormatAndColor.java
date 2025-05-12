package day06;

import java.util.Random;

import util.MyUtil;

public class FormatAndColor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random rd = new Random();
		// 1. color
		
		// AA라는 글자를 8색으로 나타내시오. "\033[" + 숫자 + "m"
		// for문을 사용하시오. AAAAAAAAAAAAAAAA
		// 일반 8색을 구현하시오.
		for(int i=0;i<=7;i++) {
			System.out.print("\033[" + (i+30) + "m" + "AA" + "\033[0m");
		}
		MyUtil.p("");
		for(int i=0;i<=7;i++) {
			System.out.print("\033[" + (i+90) + "m" + "AA" + "\033[0m");
		}
		MyUtil.p("");
		for(int i=0;i<=7;i++) {
			System.out.print("\033[" + (i+40) + "m" + "AA" + "\033[0m");
		}
		MyUtil.p("");
		for(int i=0;i<=7;i++) {
			System.out.print("\033[" + (i+100) + "m" + "AA" + "\033[0m");
		}
		MyUtil.p("");
		
		// 확장 256색을 구현하시오.(바탕색, 글자는 공백1글자로)
		for(int i=0;i<=255;i++) {
			System.out.print("\033[48;5;" + i + "m" + " " + "\033[0m");
		}
		MyUtil.p("");
		
		// True Color
		// Red, Green, Blue을 각각 Random을 사용하여 0~255까지 중 하나를 선택
		// 해당 작업을 256번 수행하여 출력
		
		
		
		for(int i=0;i<=255;i++) {
			int R = rd.nextInt(255);
			int G = rd.nextInt(255);
			int B = rd.nextInt(255);
			System.out.print("\033[48;2;" + R+";"+G+";"+B + "m" + " " + "\033[0m");
		}
		MyUtil.p("");
		for(int i=0;i<=255;i++) {
			int R = rd.nextInt(255);
			int G = R;
			int B = R;
			System.out.print("\033[48;2;" + R+";"+G+";"+B + "m" + " " + "\033[0m");
		}
		MyUtil.p("");
		
	}

}
