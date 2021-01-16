package student;

public class Student {
	public String name,department,specialization,hostelName,mentorName;
	public String registerNo;
	public int noOfArrears;
	public double cgpa;
	public Student(String name,String registerNo,String department,String specialization, double cgpa,String hostelName,String mentorName,int noOfArrears) {
		this.name=name;
		this.registerNo=registerNo;
		this.department=department;
		this.specialization=specialization;
		this.cgpa=cgpa;
		this.hostelName=hostelName;
		this.mentorName=mentorName;
		this.noOfArrears=noOfArrears;
	}
	
	public String toString() {
		String out=String.format("Name=%s%nRegisterNo=%s%nDepartment=%s%nSpecialization=%s%nCGPA=%.2f%nHostelName=%s%nMentorName=%s%nNoOfArrears=%d%n", name,registerNo,department,specialization,cgpa,hostelName,mentorName,noOfArrears);
		return out;
	}
}
