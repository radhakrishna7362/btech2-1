package entity;

import java.util.ArrayList;

public class IntegerMath {

	public static double sumOfArray(ArrayList<Double> a) throws IndexOutOfBoundsException {
		double sum=0;
//		try {
			for(int i=0;i<=a.size();i++) {
				sum=sum+a.get(i);
				System.out.println(sum);
			}
//		}
//		catch(IndexOutOfBoundsException ie) {
//			
//		}
//		catch(ArithmeticException ae) {
//			
//		}
//		catch(Exception e) {
//			
//		}
		
		return sum;
	}
}
