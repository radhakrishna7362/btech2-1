package entity;

import java.util.ArrayList;
import java.util.Collections;

public class Student {
	private long sID;
	private ArrayList<Course> reg;
	
	public Student(long sID) {
		this.sID=sID;
		this.reg=new ArrayList<Course>(5);
	}
	
	public void register(ArrayList<Course> c) {
		this.reg=c;
		Collections.sort(reg);
	}
	
	public String toString() {
		String out="";
		out+=String.format("Student Id: %d%n", this.sID);
		out+=String.format("Registered Courses: %n");
		for(Course c:reg) {
			out+=String.format("%s - %.1f%n",c.getCourseCode(),c.getCourseCredits());
		}
		return out;
	}
}
