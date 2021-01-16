package entity;


public class Course implements Comparable<Course> {
	private String courseCode;
	private double courseCredits;
	
	public Course(String cc,double c) {
		this.setCourseCode(cc);
		this.setCourseCredits(c);
	}
	
	public int compareTo(Course cou) {
		int c;
		if(this.courseCredits>cou.courseCredits) c=1;
		else if(this.courseCredits<cou.courseCredits) c=-1;
		else c=this.courseCode.compareTo(cou.courseCode);;
		return c;
	}
	
	public boolean setCourseCode(String cc) {
		if(!cc.isEmpty() && cc!=null) {
			this.courseCode=cc;
			return true;
		}
		return false;
	}
	
	public boolean setCourseCredits(double c) {
		if(c>0) {
			this.courseCredits=c;
			return true;
		}
		return false;
	}
	
	public String getCourseCode() {
		return this.courseCode.toUpperCase();
	}
	public double getCourseCredits() {
		return this.courseCredits;
	}
}
