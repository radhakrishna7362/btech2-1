package swap;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s=new Scanner(System.in);
		System.out.println("Enter 'a' Value:");
		int a=s.nextInt();
		System.out.println("Enter 'b' Value:");
		int b=s.nextInt();
		swap s1=new swap(a,b);
	}

}
