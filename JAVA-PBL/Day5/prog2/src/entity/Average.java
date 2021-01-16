package entity;

import java.io.*;
import java.util.Scanner;

public class Average {
	private static Scanner s=new Scanner(System.in);
	public static void main(String args[]) {
		double average = 0;
		PrintWriter pw;
		try {
			average=calcAverage();
			String ofName=s.next();
			System.out.println("Enter the output file name");
			File onf=new File(ofName);
			pw=new PrintWriter(onf);
			pw.printf("The Average = %.2f",average);
			pw.flush();
			pw.close();
		}
		catch(ArithmeticException ae) {
			System.out.println("Average cannot be calculated");
		}
		catch(FileNotFoundException fe) {
			System.out.println("Cannot locate the file");
		}
		finally {
			s.close();
		}
//		System.out.printf("The average= %.2f\n",average);
		System.out.println("This is the end of the program");
	}
	
	private static double calcAverage() throws ArithmeticException, FileNotFoundException {
		System.out.println("Enter the input file name");
		String ifName=s.next();
		File inf=new File(ifName);
		Scanner isf=new Scanner(inf);
		int n,sum=0,count=0;
		double average=0;
		while(isf.hasNext()) {
			n=isf.nextInt();
			sum=sum+n;
			count++;
		}
		isf.close();
		average=sum/count;
		return average;
//		try {
//			average=sum/count;
//			return average;
//		}
//		catch(ArithmeticException ae) {
//			System.out.println("Average cannot be calculated");
//			return average;
//		}
//		finally {
//			s.close();
//		}
	}
}
