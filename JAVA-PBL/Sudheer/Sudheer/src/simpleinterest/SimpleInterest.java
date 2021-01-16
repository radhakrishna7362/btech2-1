package simpleinterest;


import java.util.Scanner;

public class SimpleInterest {
	private static Scanner s=new Scanner(System.in);
	public static void main(String args[]) {
		System.out.println("Enter principal amount");
		double p=s.nextDouble();
		System.out.println("Enter time in months");
		double t=s.nextDouble();
		System.out.println("Enter rate of interest");
		double r=s.nextDouble();
		System.out.println("Simple Interest="+calculate(p,t,r));
	}
	
	public static double calculate(double p,double t,double r) {
		double si;
		si=p*t*r/100;
		return si;
	}
}
