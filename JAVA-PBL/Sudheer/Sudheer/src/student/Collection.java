package student;

import java.util.Scanner;

public class Collection {
	private Scanner s=new Scanner(System.in);
	private Student[] st;
	private String name,department,specialization,hostelName,mentorName;
	private String registerNo;
	private int noOfArrears;
	private double cgpa;
	private int n;
	public Collection(int n) {
		this.n=n;
		st=new Student[n];
		for(int i=0;i<n;i++) {
			System.out.println("1.Enter Name\n2.Enter registerNo\n3.Enter department\n4.Enter Specialization\n5.Enter CGPA\n6.Enter HostelName\n7.Enter MentorName\n8.Enter NoOfArrears:Respectively\n");
			this.name=s.next();
			this.registerNo=s.next();
			this.department=s.next();
			this.specialization=s.next();
			this.cgpa=s.nextDouble();
			this.hostelName=s.next();
			this.mentorName=s.next();
			this.noOfArrears=s.nextInt();
			st[i]=new Student(name,registerNo,department,specialization,cgpa,hostelName,mentorName,noOfArrears);
		}
		
		System.out.println("ALL STUDENT DETAILS\n");
		display();
		System.out.println("STUDENTS WITH CGPA>=7.5\n");
		cgpa();
		System.out.println("STUDENTS WITH HIGHEST NO OF ARREARS\n");
		arrears();
		System.out.println("STUDENT FROM CSE DEPARTMENT\n");
		cse();
	}
	
	public void display() {
		for(int i=0;i<n;i++) {
			System.out.println("Student "+(i+1)+" details:\n"+st[i]);
		}
	}
	
	public void cgpa() {
		for(int i=0;i<n;i++) {
			if(st[i].cgpa>=7.5) {
				System.out.println(st[i]);
			}
		}
	}
	
	public void arrears() {
		int max=st[0].noOfArrears;
		for(int i=1;i<n;i++) {
			if(st[i].noOfArrears>max) {
				max=st[i].noOfArrears;
			}
		}
		for(int i=0;i<n;i++) {
			if(st[i].noOfArrears==max) {
				System.out.println(st[i]);
			}
		}
	}
	
	public void cse() {
		for(int i=0;i<n;i++) {
			if(st[i].department.equalsIgnoreCase("CSE")) {
				System.out.println(st[i]);
			}
		}
	}
}
