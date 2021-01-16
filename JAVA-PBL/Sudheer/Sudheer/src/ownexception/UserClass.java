package ownexception;

import java.util.Scanner;

public class UserClass {
	private static Scanner s=new Scanner(System.in);
	public static void main(String args[]) throws AllowedToParticipateException{
		try {
			System.out.println("Enter Semester No");
			int sem=s.nextInt();
			System.out.println("Enter CGPA");
			double cgpa=s.nextDouble();
			if(sem>=1 && sem<=3) {
				if(cgpa>8)
					throw new AllowedToParticipateException();
				else
					System.out.println("Sorry you are not eligible");
			}
			else if(sem>=4) {
				int p=0;
				for(int i=2;i<sem;i++) {
					if(sem%i==0) {
						p=1;
						break;
					}
				}
				if(p==0 && cgpa>8) {
					throw new AllowedToParticipateException();
				}
				else {
					System.out.println("Sorry you are not eligible");
				}
			}
		}
		catch(Exception e) {
			
		}
	}
}
