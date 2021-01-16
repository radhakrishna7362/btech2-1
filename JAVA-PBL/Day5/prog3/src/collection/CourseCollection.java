package collection;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

import entity.Course;
import exceptions.WrongCourseCodeException;

public class CourseCollection {
	private static ArrayList<Course> courses = new ArrayList<Course>();
	private static Scanner sf;
	private static final String cfName = "Courses.txt";
	private static File inf= new File(cfName);
	public static void addCourses() throws FileNotFoundException, WrongCourseCodeException {
		sf=new Scanner(inf);
		while(sf.hasNext()) {
			String code=sf.next();
			if(code.equalsIgnoreCase("19SC1001")) {
				throw new WrongCourseCodeException(code);
			}
			double credits=sf.nextDouble();
			Course c=new Course(code,credits);
			courses.add(c);
		}
		sf.close();
	}
}