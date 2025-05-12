package day13;

public class Calculator implements CalculatorI {
	int left, right,center;
	
	public void setOperand(int f, int s, int t) {
		left = f;
		right = s;
		center = t;
	}
	
	public int sum() {
		return left + right + center;
	}
	
	public double avg() {
		return (double)sum() / 3;
		// return sum() / 3D;
	}
	
}
