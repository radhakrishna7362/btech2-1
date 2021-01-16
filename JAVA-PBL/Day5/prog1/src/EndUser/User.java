package EndUser;

import java.util.ArrayList;

import entity.IntegerMath;

public class User {

	public static void main(String args[]) {
		ArrayList<Double> a=new ArrayList<Double>();
		a.add(10.5);
		a.add(11.5);
		a.add(12.5);
		a.add(13.5);
		try{
			System.out.println(IntegerMath.sumOfArray(a));
		}
		catch(IndexOutOfBoundsException ie) {
			System.out.println();
		}
	}
}
